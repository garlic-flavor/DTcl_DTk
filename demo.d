/** Dtcl/Dtk dynamic binding library of Tcl/Tk, for D.
Version:    UC(dmd2.071.0)
Date:       2016-Apr-11 22:46:28
Authors: KUMA

Macros:
DMD_VERSION = 2.071.0
TCL_TK_VERSION = 8.5

はじめにお読み下さい:
これはD言語からTcl/Tkを利用する為のプログラムです。
本項にはTcl/Tk本体は付属しません。別途入手して下さい。

初めての方へ:
$(LINK2 https://github.com/nomad-software/tkd, tkd)をご利用ください。

謝辞:
$(UL
$(LI D言語で記述されています。
  $(LINK2 http://dlang.org/, Digital Mars D Programming Language))
$(LI Windows版の開発にActiveTclを参照しています。
  デモプログラムはActiveTclに添付のものから移植しました。
  $(LINK2 http://www.activestate.com/tcl, ActiveState))
)

使い方:
---
import dtk;
void main() { startTk("Hello, Tk", (tk){ with (tk)
{
    grid(ttk.button(".b").text("Hello World")).call;
}});}
---

特徴:
$(UL
$(LI $(LINK2 https://github.com/nomad-software/tkd, tkd)は、
  「tkinterみたいな使い勝手」でした。
  本ライブラリは「tclみたいな使い勝手」になっています。)
$(LI DLLの遅延読み込みを行います。)
)

開発環境:
現在は、Windows Vista x64 と ActiveTclのDLL でのみ確認をしています。

今後の方針:
$(UL
$(LI README 英語版作る。)
$(LI dtcl.utilとdtk.utilをもっとちゃんとする。)
$(LI linux対応)
$(LI よりD言語っぽく書けるようなインターフェイスにしたい。)
)

履歴:
$(UL
$(LI 2016-04-11 ver.UC(dmd2.071.0) 動いた。)
)

*/
module demo;

version (README){}
else:

import dtk;
debug import std.stdio;

/**
概要:
実行中のOSを判別する。(win32 | x11 | aqua)
 **/
string system;
/**
概要:
実行ファイルがあるフォルダ
 **/
string tk_demoDirectory;
/**
概要:
ロガーの再利用に
 **/
LoggerTk loggerTk;

void main() { startTk("Tk widget demo.", (tk) { with (tk)
{
    import std.file : thisExePath;
    import std.path : dirName;
    /*
    widget --
    This script demonstrates the various widgets provided by Tk, along with many
    of the features of the Tk toolkit. This file only contains code to generate
    the main window for the application, which invokes individual
    demonstrations. The code for the actual demonstrations is contained in
    separate ".tcl" files is this directory, which are sourced by this script as
    needed.
    */
    requireTcl(8, 5);
    requireTk(8, 5);
    require("msgcat");
    system = windowingsystem.call.result.to!string;

    _destroy(winfo.child(".")).call;
    tk_demoDirectory = thisExePath.dirName;
    tk["tk_demoDirectory"] = tk_demoDirectory;
    // 翻訳情報ファイルがあるフォルダ
    msgcat.mcload(tk_demoDirectory).call;
    wm.title(".", mc("Widget Demonstration")).call;
    if ("x11" == system)
    {
        /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        To_Do:
        implement this.
        */
        /*
        This won't work everywhere, but there's no other way in core Tk at the
        moment to display a coloured icon.
        */
        eval(`
        image create photo TclPowered \
            -file [file join $tk_library images logo64.gif]
        wm iconwindow . [toplevel ._iconWindow]
        pack [label ._iconWindow.i -image TclPowered]
        wm iconname . [mc "tkWidgetDemo"]
        `);
    }

    auto fontnames = font.names.call.result.to!(string[]);
    import std.algorithm : find;
    import std.array : empty;
    if (fontnames.find("defaultFont").empty)
    {
        // TIP #145 defines some standard named fonts
        if (!fontnames.find("TkDefaultFont").empty &&
            !fontnames.find("TkFixedFont").empty)
        {
            /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            To_Do:
            implement this.
            */

            /*
            FIX ME: the following technique of cloning the font to copy it works
                    fine but means that if the system font is changed by Tk
                    cannot update the copied font. font alias might be useful
                    here -- or fix the app to use TkDefaultFont etc.
            */
            eval("font create mainFont   {*}[font configure TkDefaultFont]");
            eval("font create fixedFont  {*}[font configure TkFixedFont]");
            eval("font create boldFont   {*}[font configure TkDefaultFont]"
                 " -weight bold");
            eval("font create titleFont  {*}[font configure TkDefaultFont]"
                 " -weight bold");
            eval("font create statusFont {*}[font configure TkDefaultFont]");
            eval("font create varsFont   {*}[font configure TkDefaultFont]");

            if (system == "aqua") tk("font configure titleFont -size 17").call;
        }
        else
        {
            /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            To_Do:
            implement this.
            */
            eval("font create mainFont   -family Helvetica -size 12");
            eval("font create fixedFont  -family Courier   -size 10");
            eval("font create boldFont   -family Helvetica -size 12"
                 " -weight bold");
            eval("font create titleFont  -family Helvetica -size 18"
                 " -weight bold");
            eval("font create statusFont -family Helvetica -size 10");
            eval("font create varsFont   -family Helvetica -size 14");
        }
    }

    tk["font"] = "mainFont";

    image.create.photo("::img::refresh").format("GIF").data(
        "R0lGODlhEAAQAJEDAP///wAAACpnKv///yH5BAEAAAMALAAAAAAQABAAAAI63IKp"
        "xgcPH2ouwgBCw1HIxHCQ4F3hSJKmwZXqWrmWxj7lKJ2dndcon9EBUq+gz3brVXAR"
        "2tICU0gXBQA7").call;

    image.create.photo("::img::view").format("GIF").data(
        "R0lGODlhEAAQAKIHAP///wwMDAAAAMDAwNnZ2SYmJmZmZv///yH5BAEAAAcALAAA"
        "AAAQABAAAANMKLos90+ASamDRxJCgw9YVnlDOXiQBgRDBRgHKE6sW8QR3doPKK27"
        "yg33q/GIOhdg6OsEJzeZykiBSUcs06e56Xx6np8ScIkFGuhQAgA7").call;

    image.create.photo("::img::delete").format("GIF").data(
        "R0lGODlhEAAQAIABAIQAAP///yH5BAEAAAEALAAAAAAQABAAAAIjjI+pmwAc3HGy"
        "PUSvqYpuvWQg40FfSVacBa5nN6JYDI3mzRQAOw==").call;

    image.create.photo("::img::print").format("GIF").data(
        "R0lGODlhEAAQALMKAAAAAP///52VunNkl8C82Yl+qldBgq+pyrOzs1fYAP///wAA"
        "AAAAAAAAAAAAAAAAACH5BAEAAAoALAAAAAAQABAAAARGUMlJKwU4AztB+ODGeUiJ"
        "fGLlgeEYmGWQXmx7aXgmAUTv/74N4EAsGhOJg1DAbDqbwoJ0Sp0KB9isNis0eL/g"
        "ryhH5pgnEQA7").call;

    /*
    Note that this is run through the message catalog! This is because this is
    actually an image of a word.
    */
    image.create.photo("::img::new").format("GIF").data(mc(
        "R0lGODlhHgAOALMPALMAANyIiOu7u8dEROaqqvru7sxVVeGZmbgREfXd3b0iItZ3"
        "d8IzM9FmZvDMzP///yH5BAEAAA8ALAAAAAAeAA4AAASa8MlJq7046827WVOCHEkw"
        "nANhUgJlEBIABJIwL3K+4IcUALCHjfbItYZDSgJgkBiYPmBMAUAkkLPKs/BAyLgM"
        "wAQwOAAY2ByCaw4QAFQSoDEePJ6DmU1xInYZTw5nOEFFdgVUelkVDTIMd3AKFGQ1"
        "MgI2AwEmQW8APZ0gdRONAks5nhIFVVxdAAkUAS2pAVwFl7ITB4UqHb0XEQA7")).call;

    /*---------------------------------------------------------------
    The code below create the main window, consisting of a menu bar and a text
    widget that explains how to use the program, plus lists all of the demos as
    hypertext items.
    ---------------------------------------------------------------*/
    menu(".menuBar").tearoff(0).call;

    if (system != "aqua") // aqua means MAC gui.
    {
        // This is a tk-internal procedure to make i18n easier
        AmpMenuArgs(".menuBar").addCascade(mc("&File"))
            .menu(".menuBar.file").call;
        menu(".menuBar.file").tearoff(0).call;
        AmpMenuArgs(".menuBar.file").addCommand(mc("&About..."))
            .command("tkAboutDialog").accelerator(mc("<F1>")).call;
        bind(".", "<F1>", "tkAboutDialog").call;
        tk(".menuBar.file").add.sep.call;
        import std.algorithm : startsWith;
        if (system.startsWith("win"))
        {
            version (Windows) {} else assert(0);
            // Windows doesn't usually have a Meta key
            AmpMenuArgs(".menuBar.file").addCommand(mc("&Quit")).command("exit")
                .accelerator(mc("Ctrl+Q")).call;
            bind(".", "<" ~ mcString("Control-q") ~ ">", "exit").call;
        }
        else
        {
            version (Windows) assert(0);
            AmpMenuArgs(".menuBar.file").addCommand(mc("&Quit")).command("exit")
                .accelerator(mc("Meta-Q")).call;
            bind(".", "<" ~ mcString("Meta-q") ~ ">", "exit").call;
        }
    }

    tk(".").configure._menu(".menuBar").call;
    ttk.frame(".statusBar").call;
    ttk.label(".statusBar.lab").text("   ").anchor("w").call;

    if (system == "aqua")
    {
        ttk.separator(".statusBar.sep").call;
        pack(".statusBar.sep").side("top").expand("yes").fill("x").pady(0).call;
    }
    pack(".statusBar.lab").side("left").padx(2).expand("yes").fill("both").call;

    if (system != "aqua")
    {
        ttk.sizegrip(".statusBar.foo").call;
        pack(".statusBar.foo").side("left").padx(2).call;
    }
    pack(".statusBar").side("bottom").fill("x").pady(2).call;

    tk["textheight"] = 30;
    tryCode({
        tk["textheight"] = cast(int)(
            (winfo.screenheight(".").call.result.to!int * 0.7)
            / (font.metrics("mainFont").displayof(".").linespace
               .call.result.to!int));
    });

    ttk.frame(".textFrame").call;
    scrollbar(".s").orient("vertical").command(".t yview").takefocus(1).call;
    pack(".s")._in(".textFrame").side("right").fill("y").call;
    auto text1 = text(".t").yscrollcommand(".s set").wrap("word").width(70)
        .height("$textheight").font("mainFont").setgrid(1)
        .highlightthickness(0).padx(4).pady(2).takefocus(0)
        .call.result.to!Text;
    pack(text1.reference)._in(".textFrame").expand("y").fill("both").padx(1)
        .call;
    pack(".textFrame").expand("yes").fill("both").call;
    if (system == "aqua")
    {
        pack.configure(".statusBar.lab").padx("10 18").pady("4 6").call;
        pack.configure(".statusBar").pady(0).call;
        text1.configure.padx(10).pady(0).call;
    }

    /*
    Create a bunch of tags to use in the text widget, such as those for section
    titles and demo descriptions. Also define the bindings for tags.
    */
    text1.tag.configure("title").font("titleFont").call;
    text1.tag.configure("subtitle").font("titleFont").call;
    text1.tag.configure("bold").font("boldFont").call;
    if (system == "aqua")
    {
        text1.tag.configure("title").spacing1(8).call;
        text1.tag.configure("subtitle").spacing3(3).call;
    }

    /*
    We put some "space" characters to the left and right of each demo
    description so that the descriptions are highlighted only when the mouse
    cursor is right over them (but not when the cursor is to their left or
    right).
    */
    text1.tag.configure("demospace").lmargin1("1c").lmargin2("1c").call;
    if (winfo.depth(".").call.result.to!int == 1)
    {
        text1.tag.configure("demo").lmargin1("1c").lmargin2("1c")
            .underline(1).call;
        text1.tag.configure("visited").lmargin1("1c").lmargin2("1c")
            .underline(1).call;
        text1.tag.configure("hot").background("black").foreground("white")
            .call;
    }
    else
    {
        text1.tag.configure("demo").lmargin1("1c").lmargin2("1c")
            .foreground("blue").underline(1).call;
        text1.tag.configure("visited").lmargin1("1c").lmargin2("1c")
            .foreground("#303080").underline(1).call;
        text1.tag.configure("hot").foreground("red").underline(1).call;
    }
    text1.tag.bind("demo", "<ButtonRelease-1>", "invoke [.t index {@%x,%y}]")
        .call;
    tk["lastLine"] =  "";
    text1.tag.bind("demo", "<Enter>",
        lambda((int x, int y)
        {
            auto lastLine = text1.index(x, y, "linestart")
                .call.result.to!string;
            text1.tag.add("hot", lastLine ~ " +1 chars",
                          lastLine ~ " lineend -1 chars").call;
            text1.config.cursor(ttk.cursor.link).call;
            tk("showStatus")(text1.index(x, y)).call;
        }, "%x %y")).call;

    text1.tag.bind("demo", "<Leave>",
        lambda(
        {
            text1.tag.remove("hot", "1.0", "end").call;
            text1.config.cursor(ttk.cursor.text).call;
            tk(".statusBar.lab").config._text("").call;
        })).call;

    text1.tag.bind("demo", "<Motion>",
        lambda((int x, int y)
        {
            import std.algorithm : filter, startsWith;
            static string lastLine = "";
            auto newLine = text1.index(x, y, "linestart")
                .call.result.to!string;
            if (newLine != lastLine)
            {
                text1.tag.remove("hot", "1.0", "end").call;
                lastLine = newLine;
                if (!text1.tag.names(Text.at(x, y))
                    .call.result.to!(string[])
                    .filter!(x=>x.startsWith("demo-")).empty)
                {
                    text1.tag.add("hot", lastLine ~ " +1 chars",
                                  lastLine ~ " lineend -1 chars").call;
                }
            }
            tk("showStatus")(text1.index(x, y)).call;
        }, "%x %y")).call;

    /*----------------------------------------------------------------------
    Create the text for the text widget.

    addFormattedText --

    Add formatted text (but not hypertext) to the text widget after first
    passing it through the message catalog to allow for localization.
    Lines starting with @@ are formatting directives (insert title, insert
    demo hyperlink, begin newline, or change style) and all other lines
    are literal strings to be inserted. Substitutions are performed,
    allowing processing pieces through the message catalog. Blank lines
    are ignored.
    */

    (formattedText)
    {
        import std.algorithm : startsWith, until;
        import std.string : splitLines, strip, stripLeft;
        import std.conv : to;
        import std.array : join;
        import std.ascii : isWhite;
        auto style = "normal";
        auto isNL = true;
        auto isNew = false;
        auto demoCount = 0;
        foreach (line; formattedText.splitLines)
        {
            auto data = line.strip;
            if (0 == data.length) continue;
            if (data.startsWith("@@"))
            {
                data = data[2..$];
                auto key = data.until!(x=>x.isWhite).to!string;
                assert(0 < key.length);
                auto val = data[key.length..$].stripLeft;

                switch(key)
                {
                case "title":
                    text1.insert.end(val, "\n title", "\n", "normal")
                        .call;
                    break;
                case "newline":
                    text1.insert.end("\n", style).call;
                    break;
                case "subtitle":
                    text1.insert.end("\n", "{}", mc(val), "subtitle",
                                     " \n ", "demospace").call;
                    isNL = true;
                    break;
                case "demo":
                    auto name = val.until!(x=>x.isWhite).to!string;
                    val = val[name.length..$].stripLeft;;
                    text1.insert.end(
                        [(++demoCount).to!string, ". ", mcString(val)].join,
                        ["demo", "demo-" ~ name]).call;
                    if (isNew)
                        text1.image.create.end.image("::img::new").padx(5)
                            .call;
                    isNew = false;
                    text1.insert.end(" \n ", "demospace").call;
                    break;
                case "new":
                    isNew = true;
                    break;
                default:
                    style = key;
                }
            }
            else
            {
                if (!isNL)
                    text1.insert.end(" ", style).call;
                isNL = false;
                text1.insert.end(data, style).call;
            }
        }
    }(mcString("
    @@title Tk Widget Demonstrations
    @@normal
    @@newline

    This application provides a front end for several short scripts
    that demonstrate what you can do with Tk widgets.  Each of the
    numbered lines below describes a demonstration;  you can click on
    it to invoke the demonstration.  Once the demonstration window
    appears, you can click the
    @@bold
    See Code
    @@normal
    button to see the Tcl/Tk code that created the demonstration.  If
    you wish, you can edit the code and click the
    @@bold
    Rerun Demo
    @@normal
    button in the code window to reinvoke the demonstration with the
    modified code.
    @@newline
") ~ "

    @@subtitle    Labels, buttons, checkbuttons, and radiobuttons
    @@demo label    Labels (text and bitmaps)
    @@demo unicodeout    Labels and UNICODE text
    @@demo button    Buttons
    @@demo check    Check-buttons (select any of a group)
    @@demo radio    Radio-buttons (select one of a group)
    @@demo puzzle    A 15-puzzle game made out of buttons
    @@demo icon        Iconic buttons that use bitmaps
    @@demo image1    Two labels displaying images
    @@demo image2    A simple user interface for viewing images
    @@demo labelframe    Labelled frames
    @@demo ttkbut    The simple Themed Tk widgets

    @@subtitle    Listboxes and Trees
    @@demo states    The 50 states
    @@demo colors    Colors: change the color scheme for the application
    @@demo sayings    A collection of famous and infamous sayings
    @@demo mclist    A multi-column list of countries
    @@demo tree        A directory browser tree

    @@subtitle    Entries, Spin-boxes and Combo-boxes
    @@demo entry1    Entries without scrollbars
    @@demo entry2    Entries with scrollbars
    @@demo entry3    Validated entries and password fields
    @@demo spin        Spin-boxes
    @@demo combo    Combo-boxes
    @@demo form        Simple Rolodex-like form

    @@subtitle    Text
    @@demo text        Basic editable text
    @@demo style    Text display styles
    @@demo bind        Hypertext (tag bindings)
    @@demo twind    A text widget with embedded windows and other features
    @@demo search    A search tool built with a text widget
    @@demo textpeer    Peering text widgets

    @@subtitle    Canvases
    @@demo items    The canvas item types
    @@demo plot        A simple 2-D plot
    @@demo ctext    Text items in canvases
    @@demo arrow    An editor for arrowheads on canvas lines
    @@demo ruler    A ruler with adjustable tab stops
    @@demo floor    A building floor plan
    @@demo cscroll    A simple scrollable canvas
    @@demo knightstour  A Knight's tour of the chess board

    @@subtitle    Scales and Progress Bars
    @@demo hscale    Horizontal scale
    @@demo vscale    Vertical scale
    @@new
    @@demo ttkscale    Themed scale linked to a label with traces
    @@demo ttkprogress    Progress bar

    @@subtitle    Paned Windows and Notebooks
    @@demo paned1    Horizontal paned window
    @@demo paned2    Vertical paned window
    @@demo ttkpane    Themed nested panes
    @@demo ttknote    Notebook widget

    @@subtitle    Menus and Toolbars
    @@demo menu        Menus and cascades (sub-menus)
    @@demo menubu    Menu-buttons
    @@demo ttkmenu    Themed menu buttons
    @@demo toolbar    Themed toolbar

    @@subtitle    Common Dialogs
    @@demo msgbox    Message boxes
    @@demo filebox    File selection dialog
    @@demo clrpick    Color picker
    @@demo fontchoose    Font selection dialog

    @@subtitle    Animation
    @@demo anilabel    Animated labels
    @@demo aniwave    Animated wave
    @@demo pendulum    Pendulum simulation
    @@demo goldberg    A celebration of Rube Goldberg

    @@subtitle    Miscellaneous
    @@demo bitmap    The built-in bitmaps
    @@demo dialog1    A dialog box with a local grab
    @@demo dialog2    A dialog box with a global grab
    ");

    //======================================================================
    text1.configure.state("disabled").call;
    focus(".s").call;

    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    To_Do:
    implement this.
    */
    eval("namespace import ::msgcat::mc");

    /*
    showVars --
    Displays the values of one or more variables in a window, and updates the
    display whenever any of the variables changes.

    Arguments:
    w    - Name of new window to create for display.
    args - Any number of names of variables.
    */
    install("showVars", (Tcl_Obj* w)
    {
        auto wStr = w.reference.toString;
        tk["w"] = w;
        try destroy(w);
        catch (Throwable){}
        toplevel(w).call;

        if (system == "x11")
            wm.attributes(w).type("dialog").call;
        wm.title(w, mc("Variable values")).call;

        auto b = ttk.frame(wStr ~ ".frame").call.result;
        scope(exit) b.release;
        tk["b"] = b.reference;
        grid(b).sticky("news").call;

    eval(`
    set f [ttk::labelframe $b.title -text [mc "Variable values:"]]
    foreach var $args {
    ttk::label $f.n$var -text "$var:" -anchor w
    ttk::label $f.v$var -textvariable $var -anchor w
    grid $f.n$var $f.v$var -padx 2 -pady 2 -sticky w
    }
    ttk::button $b.ok -text [mc "OK"] \
    -command [list destroy $w] -default active
    bind $w <Return> [list $b.ok invoke]
    bind $w <Escape> [list $b.ok invoke]

    grid $f -sticky news -padx 4
    grid $b.ok -sticky e -padx 4 -pady {6 4}
    if {[tk windowingsystem] eq "aqua"} {
    $b.ok configure -takefocus 0
    grid configure $b.ok -pady {10 12} -padx {16 18}
    grid configure $f -padx 10 -pady {10 0}
    }
    grid columnconfig $f 1 -weight 1
    grid rowconfigure $f 100 -weight 1
    grid columnconfig $b 0 -weight 1
    grid rowconfigure $b 0 -weight 1
    grid columnconfig $w 0 -weight 1
    grid rowconfigure $w 0 -weight 1
}`);
    });

    /*
    invoke --
    This procedure is called when the user clicks on a demo description. It is
    responsible for invoking the demonstration.

    Arguments:
    index - The index of the character that the user clicked on.
    */
    install("invoke", (Tcl_Obj* index)
    {
        import std.algorithm : startsWith, find;
        import std.array : empty;
        import std.path : buildPath, setExtension;
        auto tags = text1.tag.names(index).call.result.to!(string[])
            .find!(x=>x.startsWith("demo-"));
        if (tags.empty) return;
        auto cursor = text1.cget.cursor.call.result.ptr;
        text1.configure.cursor(ttk.cursor("busy")).call;

        // auto source = tk["tk_demoDirectory"].to!string
        //     .buildPath(tags[0][5..$]).setExtension(".tcl");

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*
        To_Do:
        invoke the script.
        */
        auto source = tags[0][5..$];
        if (auto proc = source in Demos) (*proc)(tk);
        else
            messageBox.ok.title("Tk Demo").detail(
                source ~ " is not implemented.").call;

        eval("update");
        text1.configure.cursor(cursor).call;
        auto indexStr = index.toString;
        text1.tag.add("visited",
                      indexStr ~ " linestart +1 chars",
                      indexStr ~ " lineend -1 chars").call;
    });

    /*
    showStatus --

    Show the name of the demo program in the status bar. This procedure is
    called when the user moves the cursor over a demo description.
    */
    install("showStatus", (Tcl_Obj* index)
    {
        import std.algorithm : find, startsWith;
        import std.array : empty, front;

        auto cursor = text1.cget.cursor.call.result.ptr;
        scope(exit) cursor.release;
        auto tags = text1.tag.names(index.reference)
            .call.result.to!(string[]).find!(x=>x.startsWith("demo-"));
        Tcl_Obj* newcursor;
        if (tags.empty)
        {
            tk(".statusBar.lab").config._text(" ").call;
            newcursor = ttk.cursor.text.call.result.ptr;
        }
        else
        {
            tk(".statusBar.lab").config._text(mc(`Run the "%s" sample program`,
                                                tags.front[5..$])).call;
            newcursor = ttk.cursor.link.call.result.ptr;
        }
        if (cursor.toString != newcursor.toString)
            text1.config.cursor(newcursor).call;;

    });

    /*
    evalShowCode --

    Arguments:
    w - Name of text widget containing code to eval
    */
    install("evalShowCode", (string w)
    {
        messageBox.ok.title("NO IMPLEMENTATION").detail(
            "sorry, this feature is not implemented yet.").call;

        // eval(tk(w).get("1.0", "end-1c").call.result.to!string);

        return;
    });

    /*
    showCode --
    This procedure creates a toplevel window that displays the code for a
    demonstration and allows it to be edited and reinvoked.

    Arguments:
    w - The name of the demonstration's window, which can be used to
        derive the name of the file containing its code.
    */
    install("showCode", (string w)
    {
        auto srcName = w[1..$];
        if (auto proc = srcName in Demos)
        {
            if (loggerTk is null) loggerTk = new LoggerTk(tk);
            assert(loggerTk !is null);
            (*proc)(loggerTk);
            auto code = loggerTk.flushLog;

            auto top = ".code";
            if (!winfo.exists(top).call.result.to!bool)
            {
                toplevel(top).call;
                if (system == "x11") wm.attributes(top).type("dialog").call;
                auto t = frame(top ~ ".f").call.result.to!string;
                auto xscroll = t ~ ".xscroll";
                auto yscroll = t ~ ".yscroll";
                auto text2 = text(t ~ ".text").font("fixedFont").height(24)
                     .wrap("word")
                     .xscrollcommand([xscroll, "set"])
                     .yscrollcommand([yscroll, "set"])
                     .setgrid(1).highlightthickness(0).pady(2).padx(3)
                     .call.result.to!string;
                scrollbar(xscroll).command([text2, "xview"])
                    .orient("horizontal").call;
                scrollbar(yscroll).command([text2, "yview"])
                    .orient("vertical").call;
                grid(text2, yscroll).sticky("news").call;
                grid.rowconfigure(t, 0).weight(1).call;
                grid.columnconfigure(t, 0).weight(1).call;

                auto btns = ttk.frame(top ~ ".btns").call.result.to!string;
                auto sep = btns ~ ".sep";
                ttk.separator(sep).call;
                grid(sep).columnspan(4).row(0).sticky("ew").pady(2).call;

                auto dismiss = btns ~ ".dismiss";
                ttk.button(dismiss).text(mc("Dismiss"))._default("active")
                    .command(["destroy", top]).image("::img::delete")
                    .compound("left").call;

                auto print = btns ~ ".print";
                ttk.button(print).text(mc("Print Code"))
                    .command(["printCode", text2, srcName])
                    .image("::img::print").compound("left").call;

                auto rerun = btns ~ ".rerun";
                ttk.button(rerun).text(mc("Rerun Demo"))
                    .command(["evalShowCode", text2])
                    .image("::img::refresh").compound("left").call;
                foreach (i, one; [rerun, print, dismiss])
                    grid(one).row(1).column(i+1).padx(4).pady(4).call;
                grid.columnconfigure(btns, 0).weight(1).call;

                if (system == "aqua")
                {
                    foreach (i, one; [rerun, print, dismiss])
                        tk(one).configure._takefocus(0).call;
                    grid.configure(sep).pady(0).call;
                    foreach (i, one; [rerun, print, dismiss])
                        grid.configure(one).pady("10 12").call;
                    grid.configure(rerun).padx("16 4");
                    grid.configure(dismiss).padx("4 18");
                }
                grid(t).sticky("news").call;
                grid(btns).sticky("ew").call;
                grid.rowconfigure(top, 0).weight(1).call;
                grid.columnconfigure(top, 0).weight(1).call;

                bind(top, "<Return>", lambda((string w)
                {
                    if (winfo._class(w).call.result.to!string != "Text")
                        tk(dismiss).invoke.call;
                }, "%W")).call;

                bind(top, "<Escape>", bind(top, "<Return>").call).call;

                wm.title(top, mc("Demo code: %s", srcName)).call;
                wm.iconname(top, srcName).call;
                tk(text2)("delete", "1.0", "end").call;
                tk(text2).insert("1.0", code).call;
                tk(text2).mark.set.insert("1.0").call;
            }
            else
            {
                wm.deiconify(top).call;
                throw new Exception(top);
            }

        }
        else assert(0);
    });


    /*
    printCode --
    Prints the source code currently displayed in the See Code dialog. Much
    thanks to Arjen Markus for this.

    Arguments:
    w    - Name of text widget containing code to print
    file - Name of the original file (implicitly for title)
    */
    install("printCode", (string w, string file)
    {
        import std.process : environment, executeShell;
        import std.path : buildPath;
        import std.file : write, remove;
        auto code = tk(w).get("1.0", "end-1c").call.result.to!string;

        auto filename =
            environment.get("TEMP",
            environment.get("TMP",
            environment.get("HOME", "."))).buildPath("tkdemo-" ~ file);
        filename.write(code);
        scope(exit) filename.remove;

        try
        {
            version      (unix) executeShell("lp -c " ~ filename);
            else version (Windows) printTextWin32(filename);
            else static assert(0, "Operation not Implemented");
        }
        catch (Throwable t)
            messageBox("Print spooling failure").message(t.toString).call;
    });

    /*
    tkAboutDialog --

    Pops up a message box with an "about" message
    */
    install("tkAboutDialog",
    {
        import std.array : join;
        messageBox.icon("info").ok.title(mc("About Widget Demo"))
            .message(mc("Tk widget demonstration application"))
            .detail(
                [mcString("Copyright \u00a9 %s\n",
                          "1996-1997 Sun Microsystems, Inc."),
                 mcString("Copyright \u00a9 %s\n",
                          "1997-2000 Ajuba Solutions, Inc."),
                 mcString("Copyright \u00a9 %s\n",
                          "2001-2009 Donal K. Fellows"),
                 mcString("Copyright \u00a9 %s\n",
                          "2002-2007 Daniel A. Steffen")].join).call;
    });
}});}

/*
positionWindow --
This procedure is invoked by most of the demos to position a new demo
window.

Arguments:
w - The name of the window to position.
*/
void positionWindow(Tk tk, string w) { tk.wm.geometry(w, "+300+300").call; }

/*
addSeeDismiss --
Add "See Code" and "Dismiss" button frame, with optional "See Vars"

Arguments:
w - The name of the frame to use.
*/
string addSeeDismiss(Tk tk, string w, string show,
                     string[] vars = null, string extra = null)
{ with (tk){
    // See Code / Dismiss buttons
    ttk.frame(w).call;
    auto sep = w ~ ".sep";
    ttk.separator(sep).call;
    //ttk::frame $w.sep -height 2 -relief sunken
    grid(sep).columnspan(4).row(0).sticky("ew").pady(2).call;
    auto dismiss = w ~ ".dismiss";
    ttk.button(dismiss).text(mc("Dismiss")).image("::img::delete")
        .compound("left").command(
            ["destroy",  winfo.toplevel(w).call.result.to!string]).call;

    auto code = w ~ ".code";
    ttk.button(code).text(mc("See Code")).image("::img::view")
        .compound("left")
        .command(["showCode", show]).call;

    auto buttons = [code, dismiss];
    if (0 < vars.length)
    {
        auto varsStr = w ~ ".vars";
        ttk.button(varsStr).text(mc("See Variables")).image("::img::view")
            .compound("left").command(["showVars", w ~ ".dialog"] ~
                                      vars).call;
        buttons = varsStr ~ buttons;
    }
    if (0 < extra.length)
        buttons = extra ~ buttons;
    foreach (i, one; buttons)
        grid(one).column(i+1).row(1).padx(4).pady(4).call;
    grid.columnconfigure(w, 0).weight(1).call;
    if (system == "aqua")
    {
        foreach (one; buttons)
            tk(one).configure._takefocus(0).call;
        grid.configure(sep).pady(0).call;
        foreach (one; buttons)
            grid.configure(one).pady("10 12").call;
        grid.configure(buttons[0]).padx("16 4").call;
        grid.configure(buttons[$-1]).padx("4 18").call;
    }
    return w;
}}

/*
PrintTextWin32 --
Print a file under Windows using all the "intelligence" necessary

Arguments:
filename - Name of the file

Note:
Taken from the Wiki page by Keith Vetter, "Printing text files under
Windows".

Note:
Do not execute the command in the background: that way we can dispose of the
file smoothly.
*/
void printTextWin32(string filename)
{
    import std.process : executeShell;
    executeShell("notepad.exe /p " ~ filename);
}


//==============================================================================
/**
 **/
enum Demos =
["label": (Tk tk){ with (tk)
{
    auto w = ".label";
    try _destroy(w).call;
    catch (Throwable t){}
    toplevel(w).call;
    wm.title(w, "Label Demonstration").call;
    wm.iconname(w, "label").call;
    positionWindow(tk, w);
    auto msg = w ~ ".msg";
    label(msg).font("$font").wraplength("4i").justify("left")
    .text(mc("Five labels are displayed below: three textual ones on the left, and an image label and a text label on the right.  Labels are pretty boring because you can't do anything with them.")).call;
    pack(msg).side("top").call;

    // See Code / Dismiss buttons
    auto buttons = w ~ ".buttons";
    auto btns = addSeeDismiss(tk, buttons, w);
    pack(btns).side("bottom").fill("x").call;
    auto left = w ~ ".left";
    auto right = w ~ ".right";
    frame(left).call;
    frame(right).call;
    pack(left, right).side("left").expand("yes").padx(10).pady(10)
    .fill("both").call;

    auto l1 = left ~ ".l1";
    auto l2 = left ~ ".l2";
    auto l3 = left ~ ".l3";
    label(l1).text(mc("First label")).call;
    label(l2).text(mc("Second label, raised")).relief("raised").call;
    label(l3).text(mc("Third label, sunken")).relief("sunken").call;
    pack(l1, l2, l3).side("top").expand("yes").pady(2).anchor("w").call;

    // Main widget program sets variable tk_demoDirectory
    import std.path : buildPath;
    auto ousterhout = w ~ ".ousterhout";
    image.create.photo(ousterhout)
        .file(tk_demoDirectory.buildPath("images", "ouster.png")).call;

    auto picture = right ~ ".picture";
    auto caption = right ~ ".caption";
    label(picture).borderwidth(2).relief("sunken").image(ousterhout).call;
    label(caption).text(mc("Tcl/Tk Creator")).call;
    pack(picture, caption).side("top").call;
}}];

