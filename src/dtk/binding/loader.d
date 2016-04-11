/** Load Tk shared library.
Date:       2016-Feb-21 20:26:18
Authors:      KUMA
License:      CC0

References:
$(LINK2 http://wiki.tcl.tk/2074, How to embed Tcl in C applications)
$(LINK2 http://wiki.tcl.tk/11541, Tk C API Tutorial)
$(LINK2 http://www.tcl.tk/man/tcl8.6/TkLib/contents.htm, Tk C API)
$(LINK2 http://davesource.com/Fringe/Fringe/Computers/Languages/tcl_tk/tcl_C.html, Combining C and Tcl/Tk)
$(LINK2 http://www.gibmonks.com/practical-programming/ch47lev1sec2.html, C Libra
ry Overview)

Description:
  You can use this module with
  $(LINK2 https://github.com/DerelictOrg, DerelictUtil).$(BR)
  To do that, please ensure that the derelict.util.loader can be imported.

ToDo:
  write implementations othor than on windows.
**/
module dtk.binding.loader;

private import dtk.binding.types;
private import dtk.binding.functions;
private import dtcl.binding.loader;

version (Windows)
    enum libNames = [ "tk86.dll" ];
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
    class TkLoader : SharedLibLoader
    {
        this()
        {
            import std.string : join;
            super(libNamesTk.join(", "));
        }

        protected override void loadSymbols() {
            // bindFunc(cast(void**)&CreateDecoder, "CreateDecoder");
        }
    }
}
else
{
    import sworks.base.loader;

    class TkLoader : SharedLibLoader
    {
        override
        void load() { DTcl.load; super.load(libNames); }

        override
        void loadSymbols() { bind!(dtk.binding.functions); }
    }
}
__gshared TkLoader DTk;

shared static this() { DTk = new TkLoader; }
shared static ~this() { if (DTk) DTk.unload; }
