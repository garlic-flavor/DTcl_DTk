/**
Date:       2016-Feb-21 20:24:57

$(LINK http://www.tcl.tk/man/tcl8.6/TkLib/contents.htm)
 **/
module dtk.binding.types;

public import dtcl.binding.types;

//==============================================================================
//
// PODs
//
//==============================================================================
alias Bool = int;
alias Tk_Uid = const(char)*;

struct XColor
{
    uint r, g, b;
}

union XEvent
{
    int type;    /* must not be changed */
    XAnyEvent xany;
/*
    XKeyEvent xkey;
    XButtonEvent xbutton;
    XMotionEvent xmotion;
    XCrossingEvent xcrossing;
    XFocusChangeEvent xfocus;
    XExposeEvent xexpose;
    XGraphicsExposeEvent xgraphicsexpose;
    XNoExposeEvent xnoexpose;
    XVisibilityEvent xvisibility;
    XCreateWindowEvent xcreatewindow;
    XDestroyWindowEvent xdestroywindow;
    XUnmapEvent xunmap;
    XMapEvent xmap;
    XMapRequestEvent xmaprequest;
    XReparentEvent xreparent;
    XConfigureEvent xconfigure;
    XGravityEvent xgravity;
    XResizeRequestEvent xresizerequest;
    XConfigureRequestEvent xconfigurerequest;
    XCirculateEvent xcirculate;
    XCirculateRequestEvent xcirculaterequest;
    XPropertyEvent xproperty;
    XSelectionClearEvent xselectionclear;
    XSelectionRequestEvent xselectionrequest;
    XSelectionEvent xselection;
    XColormapEvent xcolormap;
    XClientMessageEvent xclient;
    XMappingEvent xmapping;
    XErrorEvent xerror;
    XKeymapEvent xkeymap;
*/
    int pad[24];
}

struct XAnyEvent
{
    int type;
    uint serial;
    Bool send_event;
    Display* display;
    Window window;
}

struct XErrorEvent
{
    int type;
    Display *display;
    uint serial;
    ubyte error_code;
    ubyte request_code;
    ubyte minor_code;
    XID resourceid;
}

struct Tk_CanvasTextInfo
{
    Tk_3DBorder selBorder;
    int selBorderWidth;
    XColor *selFgColorPtr;
    Tk_Item *selItemPtr;
    int selectFirst;
    int selectLast;
    Tk_Item *anchorItemPtr;
    int selectAnchor;
    Tk_3DBorder insertBorder;
    int insertWidth;
    int insertBorderWidth;
    Tk_Item *focusItemPtr;
    int gotFocus;
    int cursorOn;
}


enum TK_TAG_SPACE = 3;
struct Tk_Item
{
    int id;
    Tk_Item* nextPtr;
    Tk_Uid[TK_TAG_SPACE] staticTagSpace;

    Tk_Uid *tagPtr;
    int tagSpace;
    int numTags;
    Tk_ItemType* typePtr;
    int x1, y1, x2, y2;
    Tk_Item* prevPtr;
    Tk_State state;
    char* reserved1;
    int redraw_flags;
}


struct Tk_ItemType
{
    const(char)* name;
    int itemSize;
    Tk_ItemCreateProc* createProc;

    const(Tk_ConfigSpec)* configSpecs;
    Tk_ItemConfigureProc* configProc;

    Tk_ItemCoordProc* coordProc;
    Tk_ItemDeleteProc* deleteProc;

    Tk_ItemDisplayProc* displayProc;

    int alwaysRedraw;
    Tk_ItemPointProc* pointProc;
    Tk_ItemAreaProc* areaProc;
    Tk_ItemPostscriptProc* postscriptProc;

    Tk_ItemScaleProc* scaleProc;
    Tk_ItemTranslateProc* translateProc;

    Tk_ItemIndexProc* indexProc;
    Tk_ItemCursorProc* icursorProc;

    Tk_ItemSelectionProc* selectionProc;

    Tk_ItemInsertProc* insertProc;

    Tk_ItemDCharsProc* dCharsProc;

    Tk_ItemType* nextPtr;
    char* reserved1;
    int reserved2;
    char* reserved3;
    char* reserved4;
}


struct Tk_ConfigSpec
{
    int type;
    const(char)* argvName;
    Tk_Uid dbName;
    Tk_Uid dbClass;
    Tk_Uid defValue;
    int offset;
    int specFlags;
    const(Tk_CustomOption)* customPtr;
}

struct Tk_CustomOption
{
    Tk_OptionParseProc *parseProc;
    Tk_OptionPrintProc *printProc;
    ClientData clientData;
}

struct XSetWindowAttributes
{
    Pixmap background_pixmap;
    uint background_pixel;
    Pixmap border_pixmap;
    uint border_pixel;
    int bit_gravity;
    int win_gravity;
    int backing_store;
    uint backing_planes;
    uint backing_pixel;
    Bool save_under;
    long event_mask;
    long do_not_propagate_mask;
    Bool override_redirect;
    Colormap colormap;
    Cursor cursor;
}

struct XWindowChanges
{
    int x, y;
    int width, height;
    int border_width;
    Window sibling;
    int stack_mode;
}

struct Tk_ImageType
{
    const(char)* name;
    Tk_ImageCreateProc* createProc;
    Tk_ImageGetProc* getProc;
    Tk_ImageDisplayProc* displayProc;
    Tk_ImageFreeProc* freeProc;
    Tk_ImageDeleteProc* deleteProc;
    Tk_ImagePostscriptProc* postscriptProc;
    Tk_ImageType* nextPtr;
    char* reserved;
}

struct Tk_PhotoImageFormat
{
    const(char)* name;
    Tk_ImageFileMatchProc* fileMatchProc;
    Tk_ImageStringMatchProc* stringMatchProc;
    Tk_ImageFileReadProc* fileReadProc;
    Tk_ImageStringReadProc* stringReadProc;
    Tk_ImageFileWriteProc* fileWriteProc;
    Tk_ImageStringWriteProc* stringWriteProc;
    Tk_PhotoImageFormat* nextPtr;
}

struct Tk_PhotoImageBlock
{
    ubyte* pixelPtr;
    int width;
    int height;
    int pitch;
    int pixelSize;
    int[4] offset;
}

struct XPoint
{
    short x, y;
}

struct Tk_FontMetrics
{
    int ascent;
    int descent;
    int linespace;
}

struct XGCValues
{
    int func;
    uint plane_mask;
    uint foreground;
    uint background;
    int line_width;
    int line_style;
    int cap_style;
    int join_style;
    int fill_style;
    int fill_rule;
    int arc_mode;
    Pixmap tile;
    Pixmap stipple;
    int ts_x_origin;
    int ts_y_origin;
    Font font;
    int subwindow_mode;
    Bool graphics_exposures;
    int clip_x_origin;
    int clip_y_origin;
    Pixmap clip_mask;
    int dash_offset;
    char dashes;
}

struct Tk_GeomMgr
{
    const(char)* name;
    Tk_GeomRequestProc *requestProc;
    Tk_GeomLostSlaveProc *lostSlaveProc;
}

struct Tk_OptionSpec
{
    Tk_OptionType type;
    const(char)* optionName;
    const(char)* dbName;
    const(char)* dbClass;
    const(char)* defValue;
    int objOffset;
    int internalOffset;
    int flags;
    const(void)* clientData;
    int typeMask;
}

enum TK_NUM_SAVED_OPTIONS = 20;
struct Tk_SavedOptions
{
    char* recordPtr;
    Tk_Window tkwin;
    int numItems;
    Tk_SavedOption[TK_NUM_SAVED_OPTIONS] items;
    Tk_SavedOptions* nextPtr;
}

struct Tk_SavedOption
{
    TkOption* optionPtr;
    Tcl_Obj* valuePtr;
    double internalForm;
}

struct Tk_ArgvInfo
{
    const(char)key;
    int type;
    char* src;
    char* dst;
    const(char)* help;
}

struct Tk_SmoothMethod
{
    const(char)* name;
    int function(Tk_Canvas canvas, double* pointPtr, int numPoints,
                 int numSteps, XPoint* xPoints, double* dblPoints)
        coordProc;
    void function (Tcl_Interp *interp, Tk_Canvas canvas, double* coordPtr,
                   int numPoints, int numSteps)
        postscriptProc;
}

struct Tk_Dash
{
    int number;
    union pattern
    {
        char* pt;
        char[(size_t).sizeof] array;
    }
}

struct Tk_Outline
{
    GC gc;
    double width;
    double activeWidth;
    double disabledWidth;
    int offset;
    Tk_Dash dash;
    Tk_Dash activeDash;
    Tk_Dash disabledDash;
    void* reserved1;
    void* reserved2;
    void* reserved3;
    Tk_TSOffset tsoffset;
    XColor* color;
    XColor* activeColor;
    XColor* disabledColor;
    Pixmap stipple;
    Pixmap activeStipple;
    Pixmap disabledStipple;
}

struct Tk_TSOffset
{
    int flags;
    int xoffset;
    int yoffset;
}

struct Tk_ClassProcs
{
    uint size;
    Tk_ClassWorldChangedProc* worldChangedProc;
    Tk_ClassCreateProc* createProc;
    Tk_ClassModalProc* modalProc;
}

struct Tk_ElementSpec
{
    int ver;
    char* name;
    Tk_ElementOptionSpec* options;
    Tk_GetElementSizeProc* getSize;
    Tk_GetElementBoxProc* getBox;
    Tk_GetElementBorderWidthProc* getBorderWidth;
    Tk_DrawElementProc* draw;
}

struct Tk_ElementOptionSpec
{
    char* name;
    Tk_OptionType type;
}


//==============================================================================
//
// Opaque types
//
//==============================================================================
struct Tk_BindingTable_{}
alias Tk_BindingTable = Tk_BindingTable_*;
struct Tk_Canvas_{}
alias Tk_Canvas = Tk_Canvas_*;
struct Tk_Cursor_{}
alias Tk_Cursor = Tk_Cursor_*;
struct Tk_ErrorHandler_{}
alias Tk_ErrorHandler = Tk_ErrorHandler_*;
struct Tk_Font_{}
alias Tk_Font = Tk_Font_*;
struct Tk_Image__{}
alias Tk_Image = Tk_Image__*;
struct Tk_ImageMaster_{}
alias Tk_ImageMaster = Tk_ImageMaster_*;
struct Tk_OptionTable_{}
alias Tk_OptionTable = Tk_OptionTable_*;
struct Tk_PostscriptInfo_{}
alias Tk_PostscriptInfo = Tk_PostscriptInfo_*;
struct Tk_TextLayout_{}
alias Tk_TextLayout = Tk_TextLayout_*;
struct Tk_Window_{}
alias Tk_Window = Tk_Window_*;
struct Tk_3DBorder_{}
alias Tk_3DBorder = Tk_3DBorder_*;
struct Tk_Style_{}
alias Tk_Style = Tk_Style_*;
struct Tk_StyleEngine_{}
alias Tk_StyleEngine = Tk_StyleEngine_*;
struct Tk_StyledElement_{}
alias Tk_StyledElement = Tk_StyledElement_*;

alias GC = void*;
alias Drawable = void*;
struct Display{}
alias Window = void*;
alias Pixmap = void*;
alias Cursor = void*;
alias Atom = int;
alias XID = void*;
alias Colormap = void*;
alias Tk_PhotoHandle = void*;
alias Font = void*;
struct Visual { ubyte[40] _; }
struct TkOption{}

//==============================================================================
//
// Procedures
//
//==============================================================================
extern(C) nothrow
{
    alias Tk_ItemCreateProc =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Item* itemPtr,
                     int argc, const(Tcl_Obj*)* objv);
    alias Tk_ItemConfigureProc =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Item* itemPtr,
                     int argc, const(Tcl_Obj*)* objv, int flags);
    alias Tk_ItemCoordProc =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Item* itemPtr,
                     int argc, const(Tcl_Obj*)* argv);
    alias Tk_ItemDeleteProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, Display* display);
    alias Tk_ItemDisplayProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, Display* display,
                      Drawable dst, int x, int y, int width, int height);
    alias Tk_ItemPointProc =
        double function(Tk_Canvas canvas, Tk_Item* itemPtr, double* pointPtr);
    alias Tk_ItemAreaProc =
        int function(Tk_Canvas canvas, Tk_Item* itemPtr, double* rectPtr);
    alias Tk_ItemPostscriptProc =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Item* itemPtr,
                     int prepass);
    alias Tk_ItemScaleProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, double originX,
                      double originY, double scaleX, double scaleY);
    alias Tk_ItemTranslateProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, double deltaX,
                      double deltaY);
    alias Tk_ItemIndexProc =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Item* itemPtr,
                     Tcl_Obj* indexString, int* indexPtr);
    alias Tk_ItemCursorProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, int index);
    alias Tk_ItemSelectionProc =
        int function(Tk_Canvas canvas, Tk_Item* itemPtr, int offset,
                     char* buffer, int maxBytes);
    alias Tk_ItemInsertProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, int beforeThis,
                      Tcl_Obj* string);
    alias Tk_ItemDCharsProc =
        void function(Tk_Canvas canvas, Tk_Item* itemPtr, int first, int last);

    //--------------------------------------------------------------------

    alias Tk_OptionParseProc =
        int function(ClientData clientData, Tcl_Interp* interp, Tk_Window tkwin,
                     const(char)* value, char* widgRec, int offset);
    alias Tk_OptionPrintProc =
        const(char)* function(ClientData clientData, Tk_Window tkwin,
                              char* widgRec, int offset,
                              Tcl_FreeProc** freeProcPtr);


    //--------------------------------------------------------------------
    alias Tk_ErrorProc =
        int function(ClientData clientData, XErrorEvent* errEventPtr);
    alias Tk_EventProc = void function(ClientData clientData, XEvent* eventPtr);
    alias Tk_GenericProc =
        int function(ClientData clientData, XEvent* eventPtr);
    alias Tk_ClientMessageProc =
        int function(Tk_Window tkwin, XEvent* eventPtr);
    alias Tk_GetSelProc =
        int function(ClientData clientData, Tcl_Interp* interp,
                     const(char)* portion);
    alias Tk_LostSelProc = void function(ClientData clientData);
    alias Tk_RestrictProc =
        Tk_RestrictAction function(ClientData clientData, XEvent* eventPtr);
    alias Tk_SelectionProc =
        int function(ClientData clientData, int offset, char* buffer,
                     int maxBytes);

    //--------------------------------------------------------------------
    alias Tk_ImageCreateProc =
        int function(Tcl_Interp* interp, const(char)* name, int objc,
                     const(Tcl_Obj*)* objv, const(Tk_ImageType)* typePtr,
                     Tk_ImageMaster master, ClientData* masterDataPtr);
    alias Tk_ImageGetProc =
        ClientData function(Tk_Window tkwin, ClientData masterData);
    alias Tk_ImageDisplayProc =
        void function(ClientData instanceData, Display* display,
                      Drawable drawable, int imageX, int imageY, int width,
                      int height, int drawableX, int drawableY);
    alias Tk_ImageFreeProc =
        void function(ClientData instanceData, Display* display);
    alias Tk_ImageDeleteProc = void function(ClientData masterData);
    alias Tk_ImageChangedProc =
        void function(ClientData clientData, int x, int y, int width,
                      int height, int imageWidth, int imageHeight);
    alias Tk_ImagePostscriptProc =
        int function(ClientData clientData, Tcl_Interp* interp,
                     Tk_Window tkwin, Tk_PostscriptInfo psinfo, int x, int y,
                     int width, int height, int prepass);

    //--------------------------------------------------------------------
    alias Tk_ImageFileMatchProc =
        int function(Tcl_Channel chan, const(char)* fileName,
                     Tcl_Obj* format, int* widthPtr, int* heightPtr,
                     Tcl_Interp* interp);
    alias Tk_ImageStringMatchProc =
        int function(Tcl_Obj* dataObj, Tcl_Obj* format, int* widthPtr,
                     int* heightPtr, Tcl_Interp* interp);
    alias Tk_ImageFileReadProc =
        int function(Tcl_Interp* interp, Tcl_Channel chan,
                     const(char)* fileName, Tcl_Obj* format,
                     Tk_PhotoHandle imageHandle, int destX, int destY,
                     int width, int height, int srcX, int srcY);
    alias Tk_ImageStringReadProc =
        int function(Tcl_Interp* interp, Tcl_Obj* dataObj, Tcl_Obj* format,
                     Tk_PhotoHandle imageHandle, int destX, int destY,
                     int width, int height, int srcX, int srcY);
    alias Tk_ImageFileWriteProc =
        int function(Tcl_Interp* interp, const char* fileName, Tcl_Obj* format,
                     Tk_PhotoImageBlock* blockPtr);
    alias Tk_ImageStringWriteProc =
        int function(Tcl_Interp* interp, Tcl_Obj* format,
                     Tk_PhotoImageBlock* blockPtr);

    //--------------------------------------------------------------------
    alias Tk_GeomRequestProc =
        void function(ClientData clientData, Tk_Window tkwin);
    alias Tk_GeomLostSlaveProc =
        void function(ClientData clientData, Tk_Window tkwin);

    //--------------------------------------------------------------------
    alias Tk_ClassCreateProc =
        Window function(Tk_Window tkwin, Window parent,
                        ClientData instanceData);
    alias Tk_ClassWorldChangedProc = void function(ClientData instanceData);
    alias Tk_ClassModalProc = void function(Tk_Window tkwin, XEvent* eventPtr);

    //--------------------------------------------------------------------
    alias Tk_GetElementSizeProc =
        void function(ClientData clientData, char *recordPtr,
                      const Tk_OptionSpec **optionsPtr, Tk_Window tkwin,
                      int width, int height, int inner, int *widthPtr,
                      int *heightPtr);
    alias Tk_GetElementBoxProc =
        void function(ClientData clientData, char *recordPtr,
                      const(Tk_OptionSpec)** optionsPtr, Tk_Window tkwin, int x,
                      int y, int width, int height, int inner, int *xPtr,
                      int *yPtr, int *widthPtr, int *heightPtr);
    alias Tk_GetElementBorderWidthProc =
        int function(ClientData clientData, char *recordPtr,
                     const(Tk_OptionSpec)** optionsPtr, Tk_Window tkwin);
    alias Tk_DrawElementProc =
        void function(ClientData clientData, char *recordPtr,
                      const(Tk_OptionSpec)** optionsPtr, Tk_Window tkwin,
                      Drawable d, int x, int y, int width, int height,
                      int state);

}
//==============================================================================
//
// enums
//
//==============================================================================
enum Tk_State
{
    TK_STATE_NULL = -1, TK_STATE_ACTIVE, TK_STATE_DISABLED,
    TK_STATE_NORMAL, TK_STATE_HIDDEN
}

enum Tk_Justify
{
    TK_JUSTIFY_LEFT, TK_JUSTIFY_RIGHT, TK_JUSTIFY_CENTER
}

enum  Tk_RestrictAction
{
    TK_DEFER_EVENT, TK_PROCESS_EVENT, TK_DISCARD_EVENT
}

enum  Tk_Anchor
{
    TK_ANCHOR_N, TK_ANCHOR_NE, TK_ANCHOR_E, TK_ANCHOR_SE,
    TK_ANCHOR_S, TK_ANCHOR_SW, TK_ANCHOR_W, TK_ANCHOR_NW,
    TK_ANCHOR_CENTER
}

enum  Tk_OptionType
{
    TK_OPTION_BOOLEAN,
    TK_OPTION_INT,
    TK_OPTION_DOUBLE,
    TK_OPTION_STRING,
    TK_OPTION_STRING_TABLE,
    TK_OPTION_COLOR,
    TK_OPTION_FONT,
    TK_OPTION_BITMAP,
    TK_OPTION_BORDER,
    TK_OPTION_RELIEF,
    TK_OPTION_CURSOR,
    TK_OPTION_JUSTIFY,
    TK_OPTION_ANCHOR,
    TK_OPTION_SYNONYM,
    TK_OPTION_PIXELS,
    TK_OPTION_WINDOW,
    TK_OPTION_END,
    TK_OPTION_CUSTOM,
    TK_OPTION_STYLE
}
