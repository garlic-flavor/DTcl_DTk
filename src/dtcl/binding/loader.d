module dtcl.binding.loader;

private import dtcl.binding.types;
private import dtcl.binding.functions;

version (Windows)
    enum libNames = [ "tcl86.dll" ];
else
    static assert(0, "Need to implement libNames for this oparating system.");


static if (__traits(compiles, {import derelict.util.loader;}))
{
    private {
        import derelict.util.loader;
        import derelict.util.system;
    }

    /** Use DerelictUtil.

      $(LINK https://github.com/DerelictOrg).
    **/
    class TclLoader : SharedLibLoader
    {
        this()
        {
            import std.string : join;
            super(libNames.join(", "));
        }

        protected override void loadSymbols() {
            // bindFunc(cast(void**)&CreateDecoder, "CreateDecoder");
        }
    }
}
else
{
    import sworks.base.loader;

    class TclLoader : SharedLibLoader
    {
        override
        void load() { super.load(libNames); }

        override
        void loadSymbols() { bind!(dtcl.binding.functions); }
    }

}
__gshared TclLoader DTcl;

shared static this() { DTcl = new TclLoader; }
shared static ~this() { if (DTcl) DTcl.unload; }
