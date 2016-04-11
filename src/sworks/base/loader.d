module sworks.base.loader;

version (Windows)
{
    import core.sys.windows.windows : HMODULE, LoadLibraryExW, DWORD,
        GetProcAddress, FreeLibrary, LoadLibraryW;

    enum : DWORD
    {
        LOAD_LIBRARY_SEARCH_DEFAULT_DIRS    = 0x00001000,
    }
    /** My implementation of Shared Library Loader.

        like $(LINK https://github.com/DerelictOrg).

        Desctiption:
        searching order is,
        $(OL
        $(LI the application's installation directory.)
        $(LI system32.)
        $(LI directories these are added by user, using SetDllDirectory.)
        )
        and then, search inside of directories in the standard search path.

    **/
    abstract class SharedLibLoader
    {
        private HMODULE _lib;

        @trusted @nogc nothrow
        bool isLoaded() { return _lib !is null; }

        void unload()
        {
            if (_lib !is null) FreeLibrary(_lib);
            _lib = null;
        }

        protected
        void load(const(wchar)*[] libNames)
        {
            if (_lib !is null) return;

            for (size_t i = 0; i < libNames.length && _lib is null; ++i)
                _lib = LoadLibraryExW( libNames[i], null
                                       , LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
            for (size_t i = 0; i < libNames.length && _lib is null; ++i)
                _lib = LoadLibraryW(libNames[i]);

            if (_lib is null)
                throw new Exception("DLL " ~ toS(libNames)~ " not found.");

            loadSymbols;
        }

        //
        private
        void bindFunc(void** target, const(char)* name)
        in
        {
            assert(_lib);
            assert(target);
            assert(name);
        }
        body
        {
            (*target) = GetProcAddress(_lib, name);
            if ((*target) is null)
                throw new Exception( "fail to Load a symbol named "
                                     ~ toS(name) ~ "." );
        }

        // M is a target module name.
        protected
        void bind(alias M)()
        {
            template isFuncHolder(F...)
            {
                enum isFuncHolder =
                    is(typeof(*F[0]) == function) &&
                    is(typeof(typeof(F[0]).sizeof));
            }

            foreach (N; __traits(allMembers, M))
            {
                static if (isFuncHolder!(__traits(getMember, M, N)))
                    bindFunc(cast(void**)&__traits(getMember, M, N), N.ptr);
            }
        }

        protected abstract
        void loadSymbols();

        abstract
        void load();
    }

}
else version (linux)
{
    abstract class SharedLibLoader
    {
        import core.sys.posix.dlfcn;
        alias SharedLibHandle = void*;
    static:
        private SharedLibHandle _lib;
        private string dlldir = ".";

        static ~this() { unload; }

        @trusted @nogc nothrow
        bool isLoaded() { return _lib !is null; }

        void unload()
        {
            if (_lib !is null) dlclose(_lib);
            _lib = null;
        }

        void setDLLDir(string dir) { dlldir = dir; }

        protected
        void load(string[] libNames)
        {
            import std.utf : toUTFz;
            alias toUTF8z = toUTFz!(const(char)*);
            import std.path : buildPath;
            import std.string : join;

            if (_lib !is null) return;

            for (size_t i = 0; i < libNames.length && _lib is null; ++i)
                _lib = dlopen( toUTF8z(dlldir.buildPath(libNames[i]))
                               , RTLD_NOW);

            if (_lib is null)
                throw new Exception( "DLL " ~ libNames.join(" / ")
                                     ~ " not found.");

            loadSymbols;
        }

        //
        void bindFunc(void** target, const(char)* name)
        in
        {
            assert(_lib);
            assert(target);
            assert(name);
        }
        body
        {
            (*target) = dlsym(_lib, name);
            if ((*target) is null)
                throw new Exception( "fail to Load a symbol named "
                                     ~ toS(name) ~ "." );
        }

        protected abstract
        void loadSymbos();

        abstract
        void load();
    }
}
else
    static assert(0, "need to implement Loader for this operating system.");


private:
auto toS(T)(const(T)* n)
{
    for (size_t i = 0; i < 256; ++i)
        if (n[i] == '\0') return n[0..i].idup;
    return null;
}

string toS(T)(const(T)*[] n)
{
    import std.string : join;
    import std.conv : to;
    auto ret = new string[n.length];
    for (size_t i = 0; i < n.length; ++i)
        ret[i] = toS(n[i]).to!string;
    return ret.join(" / ");
}

