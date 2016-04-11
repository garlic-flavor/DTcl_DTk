module dtk.util;

private import dtcl;
private import dtk.binding;

class Text : TclCommandEx!(
    "text",
    "bbox", "cget", "compare", "configure",
    TclCommandEx!(
        "count",
        "-chars", "-displaychars", "-displaylines", "-indices", "-lines",
        "-xpixels", "-ypixels"),
    "debug", "delete", "dlineinfo",
    TclCommandEx!(
        "dump",
        "-all", "-command", "-image", "-mark", "-tag", "-text", "-window"),
    TclCommandEx!(
        "edit",
        "modified", "redo", "reset", "separator", "undo"),
    "get",
    TclCommandEx!(
        "image",
        "cget", "configure", "create", "names", "end", "-image",
        "-padx", "-pady"),
    "index", "insert",
    TclCommandEx!(
        "mark",
        "names", "next", "previous", "set", "unset"),
    TclCommandEx!(
        "peer",
        "create", "names"),
    "replace",
    TclCommandEx!(
        "scan",
        "mark", "dragto"),
    TclCommandEx!(
        "search",
        "-forwards", "-backwards", "-exact", "-regexp", "-nolinestop",
        "-nocase", "-count", "-all", "-overlap", "-strictlimits", "-elide"),
    "see",
    TclCommandEx!(
        "tag",
        "add", "bind", "cget", "configure", "delete", "lower", "names",
        "nextrange", "prevrange", "raise", "ranges", "remove",
        "-font", "-spacing1", "-spacing2", "-spacing3",
        "-lmargin1", "-lmargin2", "-underline",
        "-background", "-foreground", "end"),
    TclCommandEx!(
        "window",
        "cget", "configure", "create", "names"),
    TclCommandEx!(
        "xview",
        "moveto", "scroll"),
    TclCommandEx!(
        "yview",
        "moveto", "scroll", "-pickplace"),

    "-bg", "-background", "-borderwidth", "-bd", "-cursor", "-exportselection",
    "-font", "-fg", "-foreground", "-highlightbackground", "-highlightcolor",
    "-highlightthickness", "-insertbackground", "-insertborderwidth",
    "-insertofftime", "-insertontime", "-insertwidth", "-padx", "-pady",
    "-relief", "-selectbackground", "-selectborderwidth", "-selectforeground",
    "-setgrid", "-takefocus", "-xscrollcommand", "-yscrollcommand",
    "-autoseparators", "-blockcursor", "-endline", "-height",
    "-inactiveselectbackground", "-maxundo",
    "-startline", "-state", "-tabs", "-tabstyle", "-undo",
    "-width", "-wrap",

    "config", ["_image", "-image"],
    "create", "end")
{
    //
    this(Tcl tcl, string base){ super(tcl, base); }
    //
    this(Tcl tcl, Tcl_Obj*[] bases = null){ super(tcl, bases); }

    ///
    auto index(int x, int y, string postfix = null)
    { return super.opCall("index", at(x, y, postfix)); }

    ///
    static @trusted
    auto at(int x, int y, string postfix = null)
    {
        import std.conv : to;
        import std.array : join;
        if (0 < postfix.length)
            return ["@", x.to!string, ",", y.to!string, " ", postfix].join;
        else
            return ["@", x.to!string, ",", y.to!string].join;
    }
}

/**
 **/
alias _Tk = TclEx!(
    TclCommandEx!(
        "bell",
        "-displayof", "-nice"),
    "bind",
    "bindtags",
    TclCommandEx!(
        "bitmap",
        "-background", "-data", "-file", "-foreground", "-maskdata",
        "-maskfile"),
    TclCommandEx!(
        "button",
        "-activebackground", "-activeforeground", "-anchor", "-bg",
        "-background", "-bitmap", "-borderwidth", "-bd", "-compound", "-cursor",
        "-disabledforeground", "-font", "-fg", "-foreground",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-image", "-justify", "-padx", "-pady", "-relief", "-repeatdelay",
        "-repeatinterval", "-takefocus", "-text", "-textvariable", "-underline",
        "-wraplength", "-command", "-default", "-height", "-overrelief",
        "-state", "-width",),
    TclCommandEx!(
        "canvas",
        "-bg", "-borderwidth", "-bd", "-cursor", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-insertbackground",
        "-insertborderwidth", "-insertofftime", "-insertontime", "-insertwidth",
        "-relief", "-selectbackground", "-selectborderwidth",
        "-selectforeground", "-takefocus", "-xscrollcommand", "-yscrollcommand",
        "-closeenough", "-confine", "-height", "-scrollregion", "-state",
        "-width", "-xscrollincrement", "-yscrollincrement",),
    TclCommandEx!(
        "checkbutton",
        "-activebackground", "-activeforeground", "-anchor", "-bg",
        "-background", "-bitmap", "-borderwidth", "-bd", "-compound", "-cursor",
        "-disabledforeground", "-font", "-fg", "-foreground",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-image", "-justify", "-padx", "-pady", "-relief", "-takefocus",
        "-text", "-textvariable", "-underline", "-wraplength",
        "-command", "-height", "-indicatoron", "-offrelief", "-offvalue",
        "-onvalue", "-overrelief", "-selectcolor", "-selectimage", "-state",
        "-tristateimage", "-tristatevalue", "-variable", "-width",),
    "clipboard",
    TclCommandEx!(
        "console",
        "eval", "hide", "show", "title"),
    TclCommandEx!(
        "consoleinterp",
        "eval", "record"),
    "destory",
    TclCommandEx!(
        "entry",
        "-bg", "-background",
        "-borderwidth", "-bd", "-cursor", "-exportselection", "-font", "-fg",
        "-foreground", "-highlightbackground", "-highlightcolor",
        "-highlightthickness", "-insertbackground", "-insertborderwidth",
        "-insertofftime", "-insertontime", "-insertwidth", "-justify",
        "-relief", "-selectbackground", "-selectborderwidth",
        "-selectforeground", "-takefocus", "-textvariable", "-xscrollcommand",

        "-disabledbackground", "-disabledforeground", "-invalidcommand",
        "-invcmd", "-readonlybackground", "-show", "-state", "-validate",
        "-validatecommand", "-vcmd", "-width",),
    TclCommandEx!(
        "event",
        "add", "delete", "generate", "info",
        "-above", "-borderwidth", "-button", "-count", "-data", "-delta",
        "-detail", "-focus", "-height", "-keycode", "-keysym", "-mode",
        "-override", "-place", "-root", "-rootx", "-rooty", "-sendevent",
        "-serial", "-state", "-subwindow", "-time", "-warp", "-width",
        "-when", "now", "tail", "head", "mark", "-x", "-y"),
    TclCommandEx!(
        "focus",
        "-displayof", "-forec", "-lastfor"),
    TclCommandEx!(
        "font",
        "actual", "configure", "create", "delete", "familees", "measure",
        "metrics", "names",
        "-displayof", "-ascent", "-descent", "-linespace", "-fixed", "-family",
        "-size", "-weight", "-sland", "-underline", "-overstrike"),
    TclCommandEx!(
        "frame",
        "-borderwidth", "-bd", "-cursor", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-padx", "-pady", "-relief",
        "-takefocus", "-background", "-class", "-colormap", "-container",
        "-height", "-visual", "-width",),
    TclCommandEx!(
        "grab",
        "current", "release", "set", "status",
        "-global"),

    TclCommandEx!(
        "grid",
        TclCommandEx!(
            "columnconfigure",
            "-minsize", "-weight", "-uniform", "-pad"),
        TclCommandEx!(
            "configure",
            "-column", "-columnspan", "-in", "-ipadx", "-ipady", "-padx",
            "-pady", "-row", "-rowspan", "-sticky",),
        TclCommandEx!(
            "rowconfigure",
            "-minsize", "-weight", "-uniform", "-pad"),
        "anchor", "bbox", "forget", "info", "location", "propagate", "remove",
        "size", "slaves", "-sticky", "-columnspan", "-row", "-padx", "-pady",
        "-column",
        ),
    TclCommandEx!(
        "image",
        "create", "delete", "inuse", "names", "type", "types", "photo",
        "-width", "-height", "-format", "-data", "-file"),
    TclCommandEx!(
        "label",
        "-activebackground", "-activeforeground", "-anchor", "-bg",
        "-background", "-bitmap", "-borderwidth", "-bd", "-compound", "-cursor",
        "-disabledforeground", "-font", "-fg", "-foreground",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-image", "-justify", "-padx", "-pady", "-relief", "-takefocus",
        "-text", "-textvariable", "-underline", "-wraplength", "-height",
        "-state", "-width",),
    TclCommandEx!(
        "labelframe",
        "-borderwidth", "-bd", "-cursor", "-font", "-fg",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-padx", "-pady", "-relief", "-takefocus", "-text", "-background",
        "-class", "-colormap", "-height", "-labelanchor", "-labelwidget",
        "-visual", "-width",),
    TclCommandEx!(
        "listbox",
        "-bg", "-background", "-borderwidth", "-bd", "-cursor",
        "-disabledforeground", "-exportselection", "-font", "-fg",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-relief", "-selectbackground", "-selectborderwidth",
        "-selectforeground", "-setgrid", "-takefocus", "-xscrollcommand",
        "-yscrollcommand", "-activestyle", "-height", "-listvariable",
        "-selectmode", "-state", "-width",),
    // "::safe::loadTk",
    "loweer",
    TclCommandEx!(
        "menu",
        "-activebackground", "-activeborderwidth", "-activeforeground",
        "-bg", "-background", "-borderwidth", "-bd", "-cursor",
        "-disabledforeground", "-font", "-fg", "-relief", "-takefocus",
        "-postcommand", "-selectcolor", "-tearoff", "-tearoffcommand", "-title",
        "-type",),
    TclCommandEx!(
        "menubutton",
        "-activebackground", "-activeforeground", "-anchor", "-bg",
        "-background", "-bitmap", "-borderwidth", "-bd", "-compound", "-cursor",
        "-disabledforeground", "-font", "-fg", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-image", "-justify", "-padx",
        "-pady", "-relief", "-takefocus", "-text", "-textvariable",
        "-underline", "-wraplength", "-direction", "-height", "-indicatoron",
        "-menu", "-state", "-width",),

    TclCommandEx!(
        "message",
        "-anchor", "-bg", "-background", "-borderwidth", "-bd", "-cursor",
        "-font", "-fg", "-foreground", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-padx", "-pady", "-relief",
        "-takefocus", "-text", "-textvariable", "-aspect", "-justify",
        "-width",),

    TclCommandEx!(
        "option",
        "widgetDefault", "startupFile", "userDefault", "interavtive"),
    TclCommandEx!(
        "options",
        "-activebackground", "-activeborderwidth", "-activeforeground",
        "-anchor", "-bg", "-background", "-bitmap", "-borderwidth", "-bd",
        "-cursor", "-compound", "-disabledforeground", "-exportselection",
        "-font", "-fg", "-foreground", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-image", "-insertbackground",
        "-insertborderwidth", "-insertofftime", "-insertontime", "-insertwidth",
        "-jump", "-justify", "-orient", "-padx", "-pady", "-relief",
        "-repeatdelay", "-repeatinterval", "-selectbackground",
        "-selectborderwidth", "-selectforeground", "-setgrid", "-takefocus",
        "-text", "-textvariable", "-troughcolor", "-underline", "-wraplength",
        "-xscrollcommand", "-yscrollcommand",),
    TclCommandEx!(
        "pack",
        "configure", "forget", "info", "propagate", "slaves",
        "-after", "before", "-expand", "-fill", "none", "x", "y", "both",
        "-in", "-ipadx", "-ipady", "-padx", "-pady", "-side", "forget", "info",
        "-anchor"),

    TclCommandEx!(
        "panedwindow",
        "-bg", "-background", "-borderwidth", "-bd", "-cursor", "-orient",
        "-relief", "-handlepad", "-handlesize", "-height", "-proxybackground",
        "-proxyborderwidth", "-proxyrelief", "-opaqueresize", "-sashcursor",
        "-sashpad", "-sashrelief", "-sashwidth", "-showhandle", "-width",),

    TclCommandEx!(
        "photo",
        "-data", "-format", "-file", "-gamma", "-height", "-palette", "-width",
        "blank", "cget", "configure", "copy", "-from", "-to", "-shrink",
        "-zoom", "-subsample", "-compositingrule", "date", "-background",
        "-format", "-from", "-grayscale", "get", "put", "-format", "-to",
        "read", "-shrink", "redither", "transparency", "write"),
    TclCommandEx!(
        "place",
        "configure", "-anchor", "bordermode", "-height", "-in", "-relheight",
        "-relwidth", "-relx", "-rely", "-width", "-x", "-y", "forget", "info",
        "slaves"),
    TclCommandEx!(
        "radiobutton",
        "-activebackground", "-activeforeground", "-anchor", "-bg",
        "-background", "-bitmap", "-borderwidth", "-bd", "-compound", "-cursor",
        "-disabledforeground", "-font", "-fg", "-foreground",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-image", "-justify", "-padx", "-pady", "-relief", "-takefocus",
        "-text", "-textvariable", "-underline", "-wraplength", "-command",
        "-height", "-indicatoron", "-selectcolor", "-offrelief", "-overrelief",
        "-selectimage", "-state", "-tristateimage", "-tristatevalue", "-value",
        "-variable", "-width",),
    "raise",
    TclCommandEx!(
        "scale",
        "-activebackground", "-bg", "-background", "-borderwidth", "-bd",
        "-cursor", "-font", "-fg", "-foreground", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-orient", "-relief",
        "-repeatdelay", "-repeatinterval", "-takefocus", "-troughcolor",

        "-bigincrement", "-command", "-digits", "-from", "-label", "-length",
        "-resolution", "-showvalue", "-sliderlength", "-sliderrelief",
        "-state", "-tickinterval", "-to", "-variable", "-width",),
    TclCommandEx!(
        "scrollbar",
        "-activebackground", "-bg", "-background", "-borderwidth", "-bd",
        "-cursor", "-highlightbackground", "-highlightcolor",
        "-highlightthickness", "-jump", "-orient", "-relief", "-repeatdelay",
        "-repeatinterval", "-takefocus", "-troughcolor", "-activerelief",
        "-command", "-elementborderwidth", "-width",),
    TclCommandEx!(
        "selection",
        "clear", "get", "handle", "own",
        "-displayof", "-selection", "-type", "format", "-command"),
    TclCommandEx!(
        "send",
        "-async", "-displayof"),
    TclCommandEx!(
        "spinbox", "-activebackground", "-bg", "-background", "-borderwidth",
        "-bd", "-cursor", "-exportselection", "-font", "-fg", "-foreground",
        "-highlightbackground", "-highlightcolor", "-highlightthickness",
        "-insertbackground", "-insertborderwidth", "-insertofftime",
        "-insertontime", "-insertwidth", "-justify", "-relief", "-repeatdelay",
        "-repeatinterval", "-selectbackground", "-selectborderwidth",
        "-selectforeground", "-takefocus", "-textvariable", "-xscrollcommand",

        "-buttonbackground", "-buttoncursor", "-buttondownrelief",
        "-buttonuprelief", "-command", "-disabledbackground",
        "-disabledforeground", "-format", "-from", "-invalidcommand",
        "-increment", "-readonlybackground", "-state", "-to", "-validate",
        "-validatecommand", "-values", "-width", "-wrap",),
    Text,

/+
    TclCommandEx!(
        "tk",
        "appname", "caret", "window", "-x", "-y", "-height", "scaling",
        "-displayof", "inactive", "reset", "useinputmethods",
        "windowingsystem"),
    "tk_setPalette",
    "tk_bisque",
    "tk_chooseColor",
    TclCommandEx!(
        "tk_chooseDirectory",
        "-initialdir", "-mustexist", "-parent", "-title"),
    "tk_dialog",
    "tk_focusNext",
    "tk_focusPrev",
    "tk_focusFollowsMouse",
+/
    TclCommandEx!(
        "tk_getOpenFile",
        "-confirmoverwrite", "-defaultextension", "-filetypes", "-initialdir",
        "-message", "-multiple", "-parent", "-title", "-typevariable"),
/+
    TclCommandEx!(
        "tk_getSaveFile",
        "-confirmoverwrite", "-defaultextension", "-filetypes", "-initialdir",
        "-message", "-multiple", "-parent", "-title", "-typevariable"),
    "tk_optionMenu",
    "tk_popup",
    "tkerror",
    TclCommandEx!(
        "tkwait",
        "-variable", "visibility", "window"),
+/
    TclCommandEx!(
        "toplevel",
        "-borderwidth", "-bd", "-cursor", "-highlightbackground",
        "-highlightcolor", "-highlightthickness", "-padx", "-pady", "-relief",
        "-takefocus", "-background", "-class", "-colormap", "-container",
        "-height", "-menu", "-screen", "-use", "-visual", "-width",),
    TclCommandGroup!(
        "ttk",
        TclCommandEx!(
            "ttk::button",
            "-class", "-compound", "-cursor", "-image", "-state", "-style",
            "-takefocus", "-text", "-textvariable", "-underline", "-width",
            "-command", "-default",),
        TclCommandEx!(
            "ttk::checkbutton",
            "-class", "-compound", "-cursor", "-image", "-state", "-style",
            "-takefocus", "-text", "-textvariable", "-underline", "-width",
            "-command", "-offvalue", "-onvalue", "-variable",),
        TclCommandEx!(
            "ttk::combobox",
            "-class", "-cursor", "-style", "-takefocus", "-exportselection",
            "-justify", "-height", "-postcommand", "-state", "-textvariable",
            "values", "-width",),
        TclCommandEx!(
            "ttk::entry",
            "-class", "-cursor", "-style", "-takefocus", "-xscrollcommand",
            "-exportselection", "-invalidcommand", "-justify", "-show",
            "-state", "-textvariable", "-validate", "-validatecommand",
            "-width",),
        TclCommandEx!(
            "ttk::frame",
            "-class", "-cursor", "-style", "-takefocus", "-borderwidth",
            "-relief", "-padding", "-width", "-height",),
        "ttk::intro",
        TclCommandEx!(
            "ttk::label",
            "-class", "-compound", "-cursor", "-image", "-style", "-takefocus",
            "-text", "-textvariable", "-underline", "-width", "-anchor",
            "-background", "-font", "-foreground", "-justify", "-padding",
            "-relief", "-wraplength",),
        TclCommandEx!(
            "ttk::labelframe",
            "-class", "-cursor", "-style", "-takefocus", "-labelanchor",
            "-text", "-underline", "-padding", "-labelwidget", "-width",
            "-height",),
        TclCommandEx!(
            "ttk::menubutton",
            "-class",
            "-compound", "-cursor", "-image", "-state", "-style", "-takefocus",
            "-text", "-textvariable", "-underline", "-width", "-direction",
            "-menu",),
        TclCommandEx!(
            "ttk::notebook",
            "-class", "-cursor", "-style", "-takefocus", "-height", "-padding",
            "-width", "-state", "-sticky", "-padding", "-text", "-image",
            "-compound", "-underline",),
        TclCommandEx!(
            "ttk::panedwindow",
            "-class", "-cursor", "-style", "-takefocus", "-orient", "-width",
            "-height", "-weight",),

        TclCommandEx!(
            "ttk::progressbar",
            "-class", "-cursor", "-style", "-takefocus", "-orient", "-length",
            "-mode", "-maximum", "-value", "-variable", "-phase",),

        TclCommandEx!(
            "ttk::radiobutton",
            "-class", "-compound", "-cursor", "-image", "-state", "-style",
            "-takefocus", "-text", "-textvariable", "-underline", "-width",
            "-command", "-value", "-variable",),
        TclCommandEx!(
            "ttk::scale",
            "-class", "-cursor", "-style", "-takefocus", "-command", "-from",
            "-length", "-orient", "-to", "-value", "-variable",),
        TclCommandEx!(
            "ttk::scrollbar",
            "-class", "-cursor", "-style", "-takefocus", "-command", "-orient",
            ["vertical", "-orient", "vertical"],
            ["horizontal", "-orient", "horizontal"]),
        TclCommandEx!(
            "ttk::separator",
            "-class", "-cursor", "-state", "-style", "-takefocus", "-orient",),
        TclCommandEx!(
            "ttk::sizegrip",
            "-class", "-cursor", "-state", "-style", "-takefocus",),
        TclCommandEx!(
            "ttk::spinbox",
            "-class", "-cursor", "-style", "-takefocus", "-xscrollcommand",
            "-validate", "-validatecommand", "-from", "-to", "-increment",
            "-values", "-wrap", "-format", "-command",),
        TclCommandEx!(
            "ttk::style",
            "configure", "map", "lookup", "layout", "element", "create",
            "names", "options", "theme", "settings", "use",
            "-side", "-sticky", "-children"),
        TclCommandEx!(
            "ttk::treeview",
            "-class", "-cursor", "-style", "-takefocus", "-xscrollcommand",
            "-yscrollcommand", "-columns", "-displaycolumns", "-height",
            "-padding", "-selectmode", "-show",),
        TclCommandEx!(
            "ttk::widget",
            "-class", "-cursor", "-takefocus", "-style", "-xscrollcommand",
            "-yscrollcommand",),
        TclCommandEx!(
            "ttk::image",
            "-border", "-height", "-padding", "-sticky", "-width"),
        TclCommandEx!(
            "ttk_tsapi",
            "-padding", "-margins", "-width", "-height"),
        TclCommandEx!(
            "::ttk::cursor",
            "link", "text"),
        ),

    TclCommandEx!(
        "winfo",
        "atom", "atomname", "cells", "child", "children", "class",
        "colormapfull", "containing", "depth", "exists", "fpixels", "geometry",
        "-height", "id", "interps", "ismapped", "manager", "name", "parent",
        "pathname", "pixels", "pointerx", "pointerxy", "pointery", "reqheight",
        "reqwidth", "rgb", "rootx", "rooty", "screen", "screencells",
        "screendepth", "screenheight", "screenmmheight", "screenmmwidth",
        "screenvisual", "screenwidth", "server", "toplevel", "viewable",
        "visual", "visualid", "visualsavailable", "vrootheight", "vrootwidth",
        "vrootx", "vrooty", "-width", "x", "y"),

    TclCommandEx!(
        "wm",
        "aspect", "attributes", "-fullscreen", "-topmost", "-alpha",
        "-disabled", "-toolwindow", "-transparentcolor", "-alpha", "-modified",
        "-notify", "-titlepath", "-transparent", "-zoomed", "client",
        "colormapwindows", "-command", "deiconify", "focusmodel", "forget",
        "frame", "geometry", "grid", "group", "iconbitmap", "iconbitmap",
        "iconify", "iconmask", "iconname", "iconphoto", "iconposition",
        "iconwindow", "manage", "maxsize", "minsize", "overrideredirect",
        "positionfrom", "protocol", "resizable", "sizefrom", "stackorder",
        "-state", "title", "transient", "withdraw", "type"),
    ListBox,
    TclCommandEx!(
        "tk_messageBox",
        "-default", "-detail", "-icon", "-message", "-parent", "-title",
        ["abortretryignore", "-type", "abortretryignore"],
        ["ok", "-type", "ok"],
        ["okcancel", "-type", "okcancel"],
        ["retrycancel", "-type", "retrycancel"],
        ["yesno", "-type", "yesno"],
        ["yesnocancel", "-type", "yesnocancel"]),
    ["windowingsystem", "tk", "windowingsystem"],
    ["tearOff", "option", "add", "*tearOff", "0"],
    Menu,
    ["_destroy", "destroy"],
/+
    "raise",
    "lower",
    "tk_chooseDirectory",
    ["chooseColor", "tk_chooseColor", "-initialcolor"],
+/
    TclCommandEx!(
        "tk::canvas",
        "-fill", "-width"),

    TclCommandEx!(
        "::tk::AmpMenuArgs",
        "-label", "-menu", "-command", "-accelerator",
        ["addCascade", "add", "cascade", "-label"],
        ["addCommand", "add", "command", "-label"],
        ["addSeparator", "add", "separator"],
        ["addCheckbutton", "add", "checkbutton", "-label"],
        ["addRadiobutton", "add", "radiobutton", "-label"],
        ["disabled", "-state", "disabled"]),

    );

alias Menu = TclCommandEx!(
    "menu",
    "-activebackground", "-activeborderwidth", "-activeforeground", "-bg",
    "-background", "-borderwidth", "-bd", "-cursor", "-disabledforeground",
    "-font", "-fg", "-relief", "-takefocus", "-postcommand", "-selectcolor",
    "-tearoff", "-tearoffcommand", "-title", "-type",

    ["addCascade", "add", "cascade", "-menu"],
    ["addCommand", "add", "command", "-label"],
    ["addSeparator", "add", "separator"],
    ["addCheckbutton", "add", "checkbutton", "-label"],
    ["addRadiobutton", "add", "radiobutton", "-label"],
    ["disabled", "-state", "disabled"],
    "entrycget", "entryconfigure",
    "add", "-menu", "-label", "-command", "-variable", "-value", "-state");

alias ListBox = TclCommandEx!(
    "tk::listbox",
    "configure", "-yscrollcommand", "selection", "set", "curselection", "see",
    "-listvariable", "-height");


class Tk : _Tk
{
    //
    this(string t, Tcl_Interp* i) { _title = t; super(i); }

    //
    this(Tcl_Interp* i){ _title = "anonymous"; super(i); }

    /**
     **/
    void requireTk(int major, int minor)
    {
        import std.array : join;
        import std.conv : to;
        require("Tk", [major.to!string, ".", minor.to!string].join);
    }

    /**
     **/
    void tryCode(void delegate() proc)
    {
        try proc();
        catch (Throwable t)
            messageBox.ok.title(_title).detail(t.toString).call;
    }

private:
    string _title;
}

alias LoggerTk = LoggerTcl!Tk;

/**
 **/
void startTk(string title, scope void delegate(Tk) initProc)
{
    import std.utf : toUTFz;
    import std.exception : enforce;

    DTk.load;

    auto interp = Tcl_CreateInterp();
    enforce(TCL_OK == Tcl_Init(interp), "failed to initialize Tcl.");

    Tcl_SetVar(interp, "argv0", toUTFz!(const(char)*)(title),
               TCL_GLOBAL_ONLY);
    enforce(TCL_OK == Tk_Init(interp), "failed to initialize Tk.");

    auto tkc = new Tk(title, interp);

    try
    {
        initProc(tkc);
        tkc.clearCache;
    }
    catch (Throwable t)
       tkc.messageBox.ok.title(title).detail(t.toString).call;

    while(0 < Tk_GetNumMainWindows()) Tcl_DoOneEvent(0);

    tkc.clear;
    Tcl_DeleteInterp(interp);
}

