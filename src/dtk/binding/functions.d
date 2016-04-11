module dtk.binding.functions;

private import dtk.binding.types;
private import dtcl.binding.functions;

//==============================================================================
//
// External
//
//==============================================================================
extern(C) @nogc nothrow
{
    alias da_Tk_MainLoop = void function();
    alias da_Tk_3DBorderColor = XColor* function(Tk_3DBorder border);
    alias da_Tk_3DBorderGC = GC function(Tk_Window tkwin, Tk_3DBorder border,
                                         int which);
    alias da_Tk_3DHorizontalBevel =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      int x, int y, int width, int height, int leftIn,
                      int rightIn, int topBevel, int relief);
    alias da_Tk_3DVerticalBevel =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      int x, int y, int width, int height, int leftBevel,
                      int relief);
    alias da_Tk_AddOption =
        void function(Tk_Window tkwin, const(char)* name, const(char)* value,
                      int priority);
    alias da_Tk_BindEvent =
        void function(Tk_BindingTable bindingTable, XEvent* eventPtr,
                      Tk_Window tkwin, int numObjects, ClientData* objectPtr);
    alias da_Tk_CanvasDrawableCoords =
        void function(Tk_Canvas canvas, double x, double y, short* drawableXPtr,
                      short* drawableYPtr);
    alias da_Tk_CanvasEventuallyRedraw =
        void function(Tk_Canvas canvas, int x1, int y1, int x2, int y2);
    alias da_Tk_CanvasGetCoord =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, const(char)* str,
                     double* doublePtr);
    alias da_Tk_CanvasGetTextInfo =
        Tk_CanvasTextInfo* function(Tk_Canvas canvas);
    alias da_Tk_CanvasPsBitmap =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Pixmap bitmap, int x,
                     int y, int width, int height);
    alias da_Tk_CanvasPsColor =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, XColor* colorPtr);
    alias da_Tk_CanvasPsFont =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tk_Font font);
    alias da_Tk_CanvasPsPath =
        void function(Tcl_Interp* interp, Tk_Canvas canvas, double* coordPtr,
                      int numPoints);
    alias da_Tk_CanvasPsStipple =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Pixmap bitmap);
    alias da_Tk_CanvasPsY = double function(Tk_Canvas canvas, double y);
    alias da_Tk_CanvasSetStippleOrigin = void function(Tk_Canvas canvas, GC gc);
    alias da_Tk_CanvasTagsParseProc =
        int function(ClientData clientData, Tcl_Interp* interp, Tk_Window tkwin,
                     const(char)* value, char* widgRec, int offset);
    alias da_Tk_CanvasTagsPrintProc =
        const(char)*  function(ClientData clientData, Tk_Window tkwin,
                               char* widgRec, int offset,
                               Tcl_FreeProc* freeProcPtr);
    alias da_Tk_CanvasTkwin = Tk_Window function(Tk_Canvas canvas);
    alias da_Tk_CanvasWindowCoords =
        void function(Tk_Canvas canvas, double x, double y, short* screenXPtr,
                      short* screenYPtr);
    alias da_Tk_ChangeWindowAttributes =
        void function(Tk_Window tkwin, uint valueMask,
                      XSetWindowAttributes* attsPtr);
    alias da_Tk_CharBbox =
        int function(Tk_TextLayout layout, int index, int* xPtr, int* yPtr,
                     int* widthPtr, int* heightPtr);
    alias da_Tk_ClearSelection = void function(Tk_Window tkwin, Atom selection);
    alias da_Tk_ClipboardAppend =
        int function(Tcl_Interp* interp, Tk_Window tkwin, Atom target,
                     Atom format, const(char)* buffer);
    alias da_Tk_ClipboardClear =
        int function(Tcl_Interp* interp, Tk_Window tkwin);
    alias da_Tk_ConfigureInfo =
        int function(Tcl_Interp* interp, Tk_Window tkwin,
                     const(Tk_ConfigSpec)* specs, char* widgRec,
                     const(char)* argvName, int flags);
    alias da_Tk_ConfigureValue =
        int function(Tcl_Interp* interp, Tk_Window tkwin,
                     const(Tk_ConfigSpec)* specs, char* widgRec,
                     const(char)* argvName, int flags);
    alias da_Tk_ConfigureWidget =
        int function(Tcl_Interp* interp, Tk_Window tkwin,
                     const(Tk_ConfigSpec)* specs, int argc, const( char)** argv,
                     char* widgRec, int flags);
    alias da_Tk_ConfigureWindow =
        void function(Tk_Window tkwin, uint valueMask,
                      XWindowChanges* valuePtr);
    alias da_Tk_ComputeTextLayout =
        Tk_TextLayout function(Tk_Font font, const(char)* str, int numChars,
                               int wrapLength, Tk_Justify justify, int flags,
                               int* widthPtr, int* heightPtr);
    alias da_Tk_CoordsToWindow =
        Tk_Window function(int rootX, int rootY, Tk_Window tkwin);
    alias da_Tk_CreateBinding =
        uint function(Tcl_Interp* interp, Tk_BindingTable bindingTable,
                      ClientData object, const(char)* eventStr,
                      const(char)* script, int append);
    alias da_Tk_CreateBindingTable =
        Tk_BindingTable function(Tcl_Interp* interp);
    alias da_Tk_CreateErrorHandler =
        Tk_ErrorHandler function(Display* display, int errNum, int request,
                                 int minorCode, Tk_ErrorProc errorProc,
                                 ClientData clientData);
    alias da_Tk_CreateEventHandler =
        void function(Tk_Window token, uint mask, Tk_EventProc proc,
                      ClientData clientData);
    alias da_Tk_CreateGenericHandler =
        void function(Tk_GenericProc proc, ClientData clientData);
    alias da_Tk_CreateImageType = void function(const Tk_ImageType* typePtr);
    alias da_Tk_CreateItemType = void function(Tk_ItemType* typePtr);
    alias da_Tk_CreatePhotoImageFormat =
        void function(const(Tk_PhotoImageFormat)* formatPtr);
    alias da_Tk_CreateSelHandler =
        void function(Tk_Window tkwin, Atom selection, Atom target,
                      Tk_SelectionProc proc, ClientData clientData,
                      Atom format);
    alias da_Tk_CreateWindow =
        Tk_Window function(Tcl_Interp* interp, Tk_Window parent,
                           const(char)* name, const(char)* screenName);
    alias da_Tk_CreateWindowFromPath =
        Tk_Window function(Tcl_Interp* interp, Tk_Window tkwin,
                           const(char)* pathName, const(char)* screenName);
    alias da_Tk_DefineBitmap =
        int function(Tcl_Interp* interp, const(char)* name, const(void)* source,
                     int width, int height);
    alias da_Tk_DefineCursor =
        void function(Tk_Window window, Tk_Cursor cursor);
    alias da_Tk_DeleteAllBindings =
        void function(Tk_BindingTable bindingTable, ClientData object);
    alias da_Tk_DeleteBinding =
        int function(Tcl_Interp* interp, Tk_BindingTable bindingTable,
                     ClientData object, const(char)* eventStr);
    alias da_Tk_DeleteBindingTable =
        void function(Tk_BindingTable bindingTable);
    alias da_Tk_DeleteErrorHandler = void function(Tk_ErrorHandler handler);
    alias da_Tk_DeleteEventHandler =
        void function(Tk_Window token, uint mask, Tk_EventProc proc,
                      ClientData clientData);
    alias da_Tk_DeleteGenericHandler =
        void function(Tk_GenericProc proc, ClientData clientData);
    alias da_Tk_DeleteImage =
        void function(Tcl_Interp* interp, const(char)* name);
    alias da_Tk_DeleteSelHandler =
        void function(Tk_Window tkwin, Atom selection, Atom target);
    alias da_Tk_DestroyWindow = void function(Tk_Window tkwin);
    alias da_Tk_DisplayName = const(char)* function(Tk_Window tkwin);
    alias da_Tk_DistanceToTextLayout =
        int function(Tk_TextLayout layout, int x, int y);
    alias da_Tk_Draw3DPolygon =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      XPoint* pointPtr, int numPoints, int borderWidth,
                      int leftRelief);
    alias da_Tk_Draw3DRectangle =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      int x, int y, int width, int height, int borderWidth,
                      int relief);
    alias da_Tk_DrawChars =
        void function(Display* display, Drawable drawable, GC gc,
                      Tk_Font tkfont, const(char)* source, int numBytes, int x,
                      int y);
    alias da_Tk_DrawFocusHighlight =
        void function(Tk_Window tkwin, GC gc, int width, Drawable drawable);
    alias da_Tk_DrawTextLayout =
        void function(Display* display, Drawable drawable, GC gc,
                      Tk_TextLayout layout, int x, int y, int firstChar,
                      int lastChar);
    alias da_Tk_Fill3DPolygon =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      XPoint* pointPtr, int numPoints, int borderWidth,
                      int leftRelief);
    alias da_Tk_Fill3DRectangle =
        void function(Tk_Window tkwin, Drawable drawable, Tk_3DBorder border,
                      int x, int y, int width, int height, int borderWidth,
                      int relief);
    alias da_Tk_FindPhoto =
        Tk_PhotoHandle function(Tcl_Interp* interp, const(char)* imageName);
    alias da_Tk_FontId = Font function(Tk_Font font);
    alias da_Tk_Free3DBorder = void function(Tk_3DBorder border);
    alias da_Tk_FreeBitmap = void function(Display* display, Pixmap bitmap);
    alias da_Tk_FreeColor = void function(XColor* colorPtr);
    alias da_Tk_FreeColormap =
        void function(Display* display, Colormap colormap);
    alias da_Tk_FreeCursor = void function(Display* display, Tk_Cursor cursor);
    alias da_Tk_FreeFont = void function(Tk_Font f);
    alias da_Tk_FreeGC = void function(Display* display, GC gc);
    alias da_Tk_FreeImage = void function(Tk_Image image);
    alias da_Tk_FreeOptions =
        void function(const Tk_ConfigSpec* specs, char* widgRec,
                      Display* display, int needFlags);
    alias da_Tk_FreePixmap = void function(Display* display, Pixmap pixmap);
    alias da_Tk_FreeTextLayout = void function(Tk_TextLayout textLayout);
    alias da_Tk_FreeXId = void function(Display* display, XID xid);
    alias da_Tk_GCForColor = GC function(XColor* colorPtr, Drawable drawable);
    alias da_Tk_GeometryRequest =
        void function(Tk_Window tkwin, int reqWidth, int reqHeight);
    alias da_Tk_Get3DBorder =
        Tk_3DBorder function(Tcl_Interp* interp, Tk_Window tkwin,
                             Tk_Uid colorName);
    alias da_Tk_GetAllBindings =
        void function(Tcl_Interp* interp, Tk_BindingTable bindingTable,
                      ClientData object);
    alias da_Tk_GetAnchor =
        int function(Tcl_Interp* interp, const(char)* str,
                     Tk_Anchor* anchorPtr);
    alias da_Tk_GetAtomName =
        const(char)* function(Tk_Window tkwin, Atom atom);
    alias da_Tk_GetBinding =
        const(char)* function(Tcl_Interp* interp, Tk_BindingTable bindingTable,
                              ClientData object, const(char)* eventStr);
    alias da_Tk_GetBitmap =
        Pixmap function(Tcl_Interp* interp, Tk_Window tkwin, const(char)* str);
    alias da_Tk_GetBitmapFromData =
        Pixmap function(Tcl_Interp* interp, Tk_Window tkwin,
                        const(void)* source, int width, int height);
    alias da_Tk_GetCapStyle =
        int function(Tcl_Interp* interp, const(char)* str, int* capPtr);
    alias da_Tk_GetColor =
        XColor* function(Tcl_Interp* interp, Tk_Window tkwin, Tk_Uid name);
    alias da_Tk_GetColorByValue =
        XColor* function(Tk_Window tkwin, XColor* colorPtr);
    alias da_Tk_GetColormap =
        Colormap function(Tcl_Interp* interp, Tk_Window tkwin,
                          const(char)* str);
    alias da_Tk_GetCursor =
        Tk_Cursor function(Tcl_Interp* interp, Tk_Window tkwin, Tk_Uid str);
    alias da_Tk_GetCursorFromData =
        Tk_Cursor function(Tcl_Interp* interp, Tk_Window tkwin,
                           const(char)* source, const(char)* mask, int width,
                           int height, int xHot, int yHot, Tk_Uid fg,
                           Tk_Uid bg);
    alias da_Tk_GetFont =
        Tk_Font function(Tcl_Interp* interp, Tk_Window tkwin, const(char)* str);
    alias da_Tk_GetFontFromObj =
        Tk_Font function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_GetFontMetrics =
        void function(Tk_Font font, Tk_FontMetrics* fmPtr);
    alias da_Tk_GetGC =
        GC function(Tk_Window tkwin, uint valueMask,
                    XGCValues* valuePtr);
    alias da_Tk_GetImage =
        Tk_Image function(Tcl_Interp* interp, Tk_Window tkwin,
                          const(char)* name, Tk_ImageChangedProc changeProc,
                          ClientData clientData);
    alias da_Tk_GetImageMasterData =
        ClientData function(Tcl_Interp* interp, const(char)* name,
                            const(Tk_ImageType)** typePtrPtr);
    alias da_Tk_GetItemTypes = Tk_ItemType*  function();
    alias da_Tk_GetJoinStyle =
        int function(Tcl_Interp* interp, const(char)* str, int* joinPtr);
    alias da_Tk_GetJustify =
        int function(Tcl_Interp* interp, const(char)* str,
                     Tk_Justify* justifyPtr);
    alias da_Tk_GetNumMainWindows = int function();
    alias da_Tk_GetOption =
        Tk_Uid function(Tk_Window tkwin, const(char)* name,
                        const(char)* className);
    alias da_Tk_GetPixels =
        int function(Tcl_Interp* interp, Tk_Window tkwin, const(char)* str,
                     int* intPtr);
    alias da_Tk_GetPixmap =
        Pixmap function(Display* display, Drawable d, int width, int height,
                        int depth);
    alias da_Tk_GetRelief =
        int function(Tcl_Interp* interp, const(char)* name, int* reliefPtr);
    alias da_Tk_GetRootCoords =
        void function(Tk_Window tkwin, int* xPtr, int* yPtr);
    alias da_Tk_GetScrollInfo =
        int function(Tcl_Interp* interp, int argc, const(char)** argv,
                     double* dblPtr, int* intPtr);
    alias da_Tk_GetScreenMM =
        int function(Tcl_Interp* interp, Tk_Window tkwin, const(char)* str,
                     double* doublePtr);
    alias da_Tk_GetSelection =
        int function(Tcl_Interp* interp, Tk_Window tkwin, Atom selection,
                     Atom target, Tk_GetSelProc proc, ClientData clientData);
    alias da_Tk_GetUid = Tk_Uid function(const(char)* str);
    alias da_Tk_GetVisual =
        Visual*  function(Tcl_Interp* interp, Tk_Window tkwin, const(char)* str,
                          int* depthPtr, Colormap* colormapPtr);
    alias da_Tk_GetVRootGeometry =
        void function(Tk_Window tkwin, int* xPtr, int* yPtr, int* widthPtr,
                      int* heightPtr);
    alias da_Tk_Grab =
        int function(Tcl_Interp* interp, Tk_Window tkwin, int grabGlobal);
    alias da_Tk_HandleEvent = void function(XEvent* eventPtr);
    alias da_Tk_IdToWindow =
        Tk_Window function(Display* display, Window window);
    alias da_Tk_ImageChanged =
        void function(Tk_ImageMaster master, int x, int y, int width,
                      int height, int imageWidth, int imageHeight);
    alias da_Tk_Init = int function(Tcl_Interp* interp);
    alias da_Tk_InternAtom = Atom function(Tk_Window tkwin, const(char)* name);
    alias da_Tk_IntersectTextLayout =
        int function(Tk_TextLayout layout, int x, int y, int width, int height);
    alias da_Tk_MaintainGeometry =
        void function(Tk_Window slave, Tk_Window master, int x, int y,
                      int width, int height);
    alias da_Tk_MainWindow = Tk_Window function(Tcl_Interp* interp);
    alias da_Tk_MakeWindowExist = void function(Tk_Window tkwin);
    alias da_Tk_ManageGeometry =
        void function(Tk_Window tkwin, const(Tk_GeomMgr)* mgrPtr,
                      ClientData clientData);
    alias da_Tk_MapWindow = void function(Tk_Window tkwin);
    alias da_Tk_MeasureChars =
        int function(Tk_Font tkfont, const(char)* source, int numBytes,
                     int maxPixels, int flags, int* lengthPtr);
    alias da_Tk_MoveResizeWindow =
        void function(Tk_Window tkwin, int x, int y, int width, int height);
    alias da_Tk_MoveWindow = void function(Tk_Window tkwin, int x, int y);
    alias da_Tk_MoveToplevelWindow =
        void function(Tk_Window tkwin, int x, int y);
    alias da_Tk_NameOf3DBorder = const(char)* function(Tk_3DBorder border);
    alias da_Tk_NameOfAnchor = const(char)* function(Tk_Anchor anchor);
    alias da_Tk_NameOfBitmap =
        const(char)* function(Display* display, Pixmap bitmap);
    alias da_Tk_NameOfCapStyle = const(char)* function(int cap);
    alias da_Tk_NameOfColor = const(char)* function(XColor* colorPtr);
    alias da_Tk_NameOfCursor =
        const(char)* function(Display* display, Tk_Cursor cursor);
    alias da_Tk_NameOfFont = const(char)* function(Tk_Font font);
    alias da_Tk_NameOfImage = const(char)* function(Tk_ImageMaster imageMaster);
    alias da_Tk_NameOfJoinStyle = const(char)* function(int join);
    alias da_Tk_NameOfJustify = const(char)* function(Tk_Justify justify);
    alias da_Tk_NameOfRelief = const(char)* function(int relief);
    alias da_Tk_NameToWindow =
        Tk_Window function(Tcl_Interp* interp, const(char)* pathName,
                           Tk_Window tkwin);
    alias da_Tk_OwnSelection =
        void function(Tk_Window tkwin, Atom selection, Tk_LostSelProc proc,
                      ClientData clientData);
    alias da_Tk_ParseArgv =
        int function(Tcl_Interp* interp, Tk_Window tkwin, int* argcPtr,
                     const(char)** argv, const(Tk_ArgvInfo)* argTable,
                     int flags);
    alias da_Tk_PhotoPutBlock_NoComposite =
        void function(Tk_PhotoHandle handle, Tk_PhotoImageBlock* blockPtr,
                      int x, int y, int width, int height);
    alias da_Tk_PhotoPutZoomedBlock_NoComposite =
        void function(Tk_PhotoHandle handle, Tk_PhotoImageBlock* blockPtr,
                      int x, int y, int width, int height, int zoomX, int zoomY,
                      int subsampleX, int subsampleY);
    alias da_Tk_PhotoGetImage =
        int function(Tk_PhotoHandle handle, Tk_PhotoImageBlock* blockPtr);
    alias da_Tk_PhotoBlank = void function(Tk_PhotoHandle handle);
    alias da_Tk_PhotoExpand_Panic =
        void function(Tk_PhotoHandle handle, int width, int height);
    alias da_Tk_PhotoGetSize =
        void function(Tk_PhotoHandle handle, int* widthPtr, int* heightPtr);
    alias da_Tk_PhotoSetSize_Panic =
        void function(Tk_PhotoHandle handle, int width, int height);
    alias da_Tk_PointToChar = int function(Tk_TextLayout layout, int x, int y);
    alias da_Tk_PostscriptFontName =
        int function(Tk_Font tkfont, Tcl_DString* dsPtr);
    alias da_Tk_PreserveColormap =
        void function(Display* display, Colormap colormap);
    alias da_Tk_QueueWindowEvent =
        void function(XEvent* eventPtr, Tcl_QueuePosition position);
    alias da_Tk_RedrawImage =
        void function(Tk_Image image, int imageX, int imageY, int width,
                      int height, Drawable drawable, int drawableX,
                      int drawableY);
    alias da_Tk_ResizeWindow =
        void function(Tk_Window tkwin, int width, int height);
    alias da_Tk_RestackWindow =
        int function(Tk_Window tkwin, int aboveBelow, Tk_Window other);
    alias da_Tk_RestrictEvents =
        Tk_RestrictProc function(Tk_RestrictProc proc,
                                  ClientData arg, ClientData* prevArgPtr);
    alias da_Tk_SafeInit = int function(Tcl_Interp* interp);
    alias da_Tk_SetAppName =
        const(char)* function(Tk_Window tkwin, const(char)* name);
    alias da_Tk_SetBackgroundFromBorder =
        void function(Tk_Window tkwin, Tk_3DBorder border);
    alias da_Tk_SetClass =
        void function(Tk_Window tkwin, const(char)* className);
    alias da_Tk_SetGrid =
        void function(Tk_Window tkwin, int reqWidth, int reqHeight,
                      int gridWidth, int gridHeight);
    alias da_Tk_SetInternalBorder = void function(Tk_Window tkwin, int width);
    alias da_Tk_SetWindowBackground =
        void function(Tk_Window tkwin, uint pixel);
    alias da_Tk_SetWindowBackgroundPixmap =
        void function(Tk_Window tkwin, Pixmap pixmap);
    alias da_Tk_SetWindowBorder =
        void function(Tk_Window tkwin, uint pixel);
    alias da_Tk_SetWindowBorderWidth =
        void function(Tk_Window tkwin, int width);
    alias da_Tk_SetWindowBorderPixmap =
        void function(Tk_Window tkwin, Pixmap pixmap);
    alias da_Tk_SetWindowColormap =
        void function(Tk_Window tkwin, Colormap colormap);
    alias da_Tk_SetWindowVisual =
        int function(Tk_Window tkwin, Visual* visual, int depth,
                     Colormap colormap);
    alias da_Tk_SizeOfBitmap =
        void function(Display* display, Pixmap bitmap, int* widthPtr,
                      int* heightPtr);
    alias da_Tk_SizeOfImage =
        void function(Tk_Image image, int* widthPtr, int* heightPtr);
    alias da_Tk_StrictMotif = int function(Tk_Window tkwin);
    alias da_Tk_TextLayoutToPostscript =
        void function(Tcl_Interp* interp, Tk_TextLayout layout);
    alias da_Tk_TextWidth =
        int function(Tk_Font font, const(char)* str, int numBytes);
    alias da_Tk_UndefineCursor = void function(Tk_Window window);
    alias da_Tk_UnderlineChars =
        void function(Display* display, Drawable drawable, GC gc,
                      Tk_Font tkfont, const(char)* source, int x, int y,
                      int firstByte, int lastByte);
    alias da_Tk_UnderlineTextLayout =
        void function(Display* display, Drawable drawable, GC gc,
                      Tk_TextLayout layout, int x, int y, int underline);
    alias da_Tk_Ungrab = void function(Tk_Window tkwin);
    alias da_Tk_UnmaintainGeometry =
        void function(Tk_Window slave, Tk_Window master);
    alias da_Tk_UnmapWindow = void function(Tk_Window tkwin);
    alias da_Tk_UnsetGrid = void function(Tk_Window tkwin);
    alias da_Tk_UpdatePointer =
        void function(Tk_Window tkwin, int x, int y, int state);
    alias da_Tk_AllocBitmapFromObj =
        Pixmap function(Tcl_Interp* interp, Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_Alloc3DBorderFromObj =
        Tk_3DBorder function(Tcl_Interp* interp,
                             Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_AllocColorFromObj =
        XColor*  function(Tcl_Interp* interp, Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_AllocCursorFromObj =
        Tk_Cursor function(Tcl_Interp* interp, Tk_Window tkwin,
                           Tcl_Obj* objPtr);
    alias da_Tk_AllocFontFromObj =
        Tk_Font function(Tcl_Interp* interp, Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_CreateOptionTable =
        Tk_OptionTable function(Tcl_Interp* interp,
                                const(Tk_OptionSpec)* templatePtr);
    alias da_Tk_DeleteOptionTable = void function(Tk_OptionTable optionTable);
    alias da_Tk_Free3DBorderFromObj =
        void function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_FreeBitmapFromObj =
        void function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_FreeColorFromObj =
        void function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_FreeConfigOptions =
        void function(char* recordPtr, Tk_OptionTable optionToken,
                      Tk_Window tkwin);
    alias da_Tk_FreeSavedOptions = void function(Tk_SavedOptions* savePtr);
    alias da_Tk_FreeCursorFromObj =
        void function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_FreeFontFromObj =
        void function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_Get3DBorderFromObj =
        Tk_3DBorder function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_GetAnchorFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     Tk_Anchor* anchorPtr);
    alias da_Tk_GetBitmapFromObj =
        Pixmap function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_GetColorFromObj =
        XColor*  function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_GetCursorFromObj =
        Tk_Cursor function(Tk_Window tkwin, Tcl_Obj* objPtr);
    alias da_Tk_GetOptionInfo =
        Tcl_Obj*  function(Tcl_Interp* interp, char* recordPtr,
                           Tk_OptionTable optionTable, Tcl_Obj* namePtr,
                           Tk_Window tkwin);
    alias da_Tk_GetOptionValue =
        Tcl_Obj*  function(Tcl_Interp* interp, char* recordPtr,
                           Tk_OptionTable optionTable, Tcl_Obj* namePtr,
                           Tk_Window tkwin);
    alias da_Tk_GetJustifyFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     Tk_Justify* justifyPtr);
    alias da_Tk_GetMMFromObj =
        int function(Tcl_Interp* interp, Tk_Window tkwin, Tcl_Obj* objPtr,
                     double* doublePtr);
    alias da_Tk_GetPixelsFromObj =
        int function(Tcl_Interp* interp, Tk_Window tkwin, Tcl_Obj* objPtr,
                     int* intPtr);
    alias da_Tk_GetReliefFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int* resultPtr);
    alias da_Tk_GetScrollInfoObj =
        int function(Tcl_Interp* interp, int objc, const(Tcl_Obj*)* objv,
                     double* dblPtr, int* intPtr);
    alias da_Tk_InitOptions =
        int function(Tcl_Interp* interp, char* recordPtr,
                     Tk_OptionTable optionToken, Tk_Window tkwin);
    alias da_Tk_MainEx =
        void function(int argc, char** argv, Tcl_AppInitProc appInitProc,
                      Tcl_Interp* interp);
    alias da_Tk_RestoreSavedOptions = void function(Tk_SavedOptions* savePtr);
    alias da_Tk_SetOptions =
        int function(Tcl_Interp* interp, char* recordPtr,
                     Tk_OptionTable optionTable, int objc,
                     const(Tcl_Obj*)* objv, Tk_Window tkwin,
                     Tk_SavedOptions* savePtr, int* maskPtr);
    alias da_Tk_InitConsoleChannels = void function(Tcl_Interp* interp);
    alias da_Tk_CreateConsoleWindow = int function(Tcl_Interp* interp);
    alias da_Tk_CreateSmoothMethod =
        void function(Tcl_Interp* interp, const(Tk_SmoothMethod)* method);
    alias da_Tk_GetDash =
        int function(Tcl_Interp* interp, const(char)* value, Tk_Dash* dash);
    alias da_Tk_CreateOutline = void function(Tk_Outline* outline);
    alias da_Tk_DeleteOutline =
        void function(Display* display, Tk_Outline* outline);
    alias da_Tk_ConfigOutlineGC =
        int function(XGCValues* gcValues, Tk_Canvas canvas, Tk_Item* item,
                     Tk_Outline* outline);
    alias da_Tk_ChangeOutlineGC =
        int function(Tk_Canvas canvas, Tk_Item* item, Tk_Outline* outline);
    alias da_Tk_ResetOutlineGC =
        int function(Tk_Canvas canvas, Tk_Item* item, Tk_Outline* outline);
    alias da_Tk_CanvasPsOutline =
        int function(Tk_Canvas canvas, Tk_Item* item, Tk_Outline* outline);
    alias da_Tk_SetTSOrigin =
        void function(Tk_Window tkwin, GC gc, int x, int y);
    alias da_Tk_CanvasGetCoordFromObj =
        int function(Tcl_Interp* interp, Tk_Canvas canvas, Tcl_Obj* obj,
                     double* doublePtr);
    alias da_Tk_CanvasSetOffset =
        void function(Tk_Canvas canvas, GC gc, Tk_TSOffset* offset);
    alias da_Tk_DitherPhoto =
        void function(Tk_PhotoHandle handle, int x, int y, int width,
                      int height);
    alias da_Tk_PostscriptBitmap =
        int function(Tcl_Interp* interp, Tk_Window tkwin,
                     Tk_PostscriptInfo psInfo, Pixmap bitmap, int startX,
                     int startY, int width, int height);
    alias da_Tk_PostscriptColor =
        int function(Tcl_Interp* interp, Tk_PostscriptInfo psInfo,
                     XColor* colorPtr);
    alias da_Tk_PostscriptFont =
        int function(Tcl_Interp* interp, Tk_PostscriptInfo psInfo,
                     Tk_Font font);
    alias da_Tk_PostscriptImage =
        int function(Tk_Image image, Tcl_Interp* interp, Tk_Window tkwin,
                     Tk_PostscriptInfo psinfo, int x, int y, int width,
                     int height, int prepass);
    alias da_Tk_PostscriptPath =
        void function(Tcl_Interp* interp, Tk_PostscriptInfo psInfo,
                      double* coordPtr, int numPoints);
    alias da_Tk_PostscriptStipple =
        int function(Tcl_Interp* interp, Tk_Window tkwin,
                     Tk_PostscriptInfo psInfo, Pixmap bitmap);
    alias da_Tk_PostscriptY =
        double function(double y, Tk_PostscriptInfo psInfo);
    alias da_Tk_PostscriptPhoto =
        int function(Tcl_Interp* interp, Tk_PhotoImageBlock* blockPtr,
                     Tk_PostscriptInfo psInfo, int width, int height);
    alias da_Tk_CreateClientMessageHandler =
        void function(Tk_ClientMessageProc proc);
    alias da_Tk_DeleteClientMessageHandler =
        void function(Tk_ClientMessageProc proc);
    alias da_Tk_CreateAnonymousWindow =
        Tk_Window function(Tcl_Interp* interp, Tk_Window parent,
                           const(char)* screenName);
    alias da_Tk_SetClassProcs =
        void function(Tk_Window tkwin, const Tk_ClassProcs* procs,
                      ClientData instanceData);
    alias da_Tk_SetInternalBorderEx =
        void function(Tk_Window tkwin, int left, int right, int top,
                      int bottom);
    alias da_Tk_SetMinimumRequestSize =
        void function(Tk_Window tkwin, int minWidth, int minHeight);
    alias da_Tk_SetCaretPos =
        void function(Tk_Window tkwin, int x, int y, int height);
    alias da_Tk_PhotoPutBlock_Panic =
        void function(Tk_PhotoHandle handle, Tk_PhotoImageBlock* blockPtr,
                      int x, int y, int width, int height, int compRule);
    alias da_Tk_PhotoPutZoomedBlock_Panic =
        void function(Tk_PhotoHandle handle, Tk_PhotoImageBlock* blockPtr,
                      int x, int y, int width, int height, int zoomX, int zoomY,
                      int subsampleX, int subsampleY, int compRule);
    alias da_Tk_CollapseMotionEvents =
        int function(Display* display, int collapse);
    alias da_Tk_RegisterStyleEngine =
        Tk_StyleEngine function(const(char)* name, Tk_StyleEngine parent);
    alias da_Tk_GetStyleEngine = Tk_StyleEngine function(const(char)* name);
    alias da_Tk_RegisterStyledElement =
        int function(Tk_StyleEngine engine, Tk_ElementSpec* templatePtr);
    alias da_Tk_GetElementId = int function(const(char)* name);
    alias da_Tk_CreateStyle =
        Tk_Style function(const(char)* name, Tk_StyleEngine engine,
                          ClientData clientData);
    alias da_Tk_GetStyle =
        Tk_Style function(Tcl_Interp* interp, const(char)* name);
    alias da_Tk_FreeStyle = void function(Tk_Style style);
    alias da_Tk_NameOfStyle = const(char)* function(Tk_Style style);
    alias da_Tk_AllocStyleFromObj =
        Tk_Style function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tk_GetStyleFromObj = Tk_Style function(Tcl_Obj* objPtr);
    alias da_Tk_FreeStyleFromObj = void function(Tcl_Obj* objPtr);
    alias da_Tk_GetStyledElement =
        Tk_StyledElement function(Tk_Style style, int elementId,
                                  Tk_OptionTable optionTable);
    alias da_Tk_GetElementSize =
        void function(Tk_Style style, Tk_StyledElement element,
                      char* recordPtr, Tk_Window tkwin, int width, int height,
                      int inner, int* widthPtr, int* heightPtr);
    alias da_Tk_GetElementBox =
        void function(Tk_Style style, Tk_StyledElement element,
                      char* recordPtr, Tk_Window tkwin, int x, int y, int width,
                      int height, int inner, int* xPtr, int* yPtr,
                      int* widthPtr, int* heightPtr);
    alias da_Tk_GetElementBorderWidth =
        int function(Tk_Style style, Tk_StyledElement element, char* recordPtr,
                     Tk_Window tkwin);
    alias da_Tk_DrawElement =
        void function(Tk_Style style, Tk_StyledElement element, char* recordPtr,
                      Tk_Window tkwin, Drawable d, int x, int y, int width,
                      int height, int state);
    alias da_Tk_PhotoExpand =
        int function(Tcl_Interp* interp, Tk_PhotoHandle handle, int width,
                     int height);
    alias da_Tk_PhotoPutBlock =
        int function(Tcl_Interp* interp, Tk_PhotoHandle handle,
                     Tk_PhotoImageBlock* blockPtr, int x, int y, int width,
                     int height, int compRule);
    alias da_Tk_PhotoPutZoomedBlock =
        int function(Tcl_Interp* interp, Tk_PhotoHandle handle,
                     Tk_PhotoImageBlock* blockPtr, int x, int y, int width,
                     int height, int zoomX, int zoomY, int subsampleX,
                     int subsampleY, int compRule);
    alias da_Tk_PhotoSetSize =
        int function(Tcl_Interp* interp, Tk_PhotoHandle handle, int width,
                     int height);
    alias da_Tk_GetUserInactiveTime = int function(Display* dpy);
    alias da_Tk_ResetUserInactiveTime = void function(Display* dpy);
    alias da_Tk_Interp = Tcl_Interp*  function(Tk_Window tkwin);
    alias da_Tk_CreateOldImageType = void function(const Tk_ImageType* typePtr);
    alias da_Tk_CreateOldPhotoImageFormat =
        void function(const Tk_PhotoImageFormat* formatPtr);
}

__gshared
{
    da_Tk_3DBorderColor Tk_3DBorderColor;
    da_Tk_3DBorderGC Tk_3DBorderGC;
    da_Tk_3DHorizontalBevel Tk_3DHorizontalBevel;
    da_Tk_3DVerticalBevel Tk_3DVerticalBevel;
    da_Tk_AddOption Tk_AddOption;
    da_Tk_Alloc3DBorderFromObj Tk_Alloc3DBorderFromObj;
    da_Tk_AllocBitmapFromObj Tk_AllocBitmapFromObj;
    da_Tk_AllocColorFromObj Tk_AllocColorFromObj;
    da_Tk_AllocCursorFromObj Tk_AllocCursorFromObj;
    da_Tk_AllocFontFromObj Tk_AllocFontFromObj;
    da_Tk_AllocStyleFromObj Tk_AllocStyleFromObj;
    // da_Tk_AttachHWND Tk_AttachHWND;
    da_Tk_BindEvent Tk_BindEvent;
    da_Tk_CanvasDrawableCoords Tk_CanvasDrawableCoords;
    da_Tk_CanvasEventuallyRedraw Tk_CanvasEventuallyRedraw;
    da_Tk_CanvasGetCoord Tk_CanvasGetCoord;
    da_Tk_CanvasGetCoordFromObj Tk_CanvasGetCoordFromObj;
    da_Tk_CanvasGetTextInfo Tk_CanvasGetTextInfo;
    da_Tk_CanvasPsBitmap Tk_CanvasPsBitmap;
    da_Tk_CanvasPsColor Tk_CanvasPsColor;
    da_Tk_CanvasPsFont Tk_CanvasPsFont;
    da_Tk_CanvasPsOutline Tk_CanvasPsOutline;
    da_Tk_CanvasPsPath Tk_CanvasPsPath;
    da_Tk_CanvasPsStipple Tk_CanvasPsStipple;
    da_Tk_CanvasPsY Tk_CanvasPsY;
    da_Tk_CanvasSetOffset Tk_CanvasSetOffset;
    da_Tk_CanvasSetStippleOrigin Tk_CanvasSetStippleOrigin;
    da_Tk_CanvasTagsParseProc Tk_CanvasTagsParseProc;
    da_Tk_CanvasTagsPrintProc Tk_CanvasTagsPrintProc;
    da_Tk_CanvasTkwin Tk_CanvasTkwin;
    da_Tk_CanvasWindowCoords Tk_CanvasWindowCoords;
    da_Tk_ChangeOutlineGC Tk_ChangeOutlineGC;
    da_Tk_ChangeWindowAttributes Tk_ChangeWindowAttributes;
    da_Tk_CharBbox Tk_CharBbox;
    da_Tk_ClearSelection Tk_ClearSelection;
    da_Tk_ClipboardAppend Tk_ClipboardAppend;
    da_Tk_ClipboardClear Tk_ClipboardClear;
    da_Tk_CollapseMotionEvents Tk_CollapseMotionEvents;
    da_Tk_ComputeTextLayout Tk_ComputeTextLayout;
    da_Tk_ConfigOutlineGC Tk_ConfigOutlineGC;
    da_Tk_ConfigureInfo Tk_ConfigureInfo;
    da_Tk_ConfigureValue Tk_ConfigureValue;
    da_Tk_ConfigureWidget Tk_ConfigureWidget;
    da_Tk_ConfigureWindow Tk_ConfigureWindow;
    da_Tk_CoordsToWindow Tk_CoordsToWindow;
    da_Tk_CreateAnonymousWindow Tk_CreateAnonymousWindow;
    da_Tk_CreateBinding Tk_CreateBinding;
    da_Tk_CreateBindingTable Tk_CreateBindingTable;
    da_Tk_CreateClientMessageHandler Tk_CreateClientMessageHandler;
    da_Tk_CreateConsoleWindow Tk_CreateConsoleWindow;
    da_Tk_CreateErrorHandler Tk_CreateErrorHandler;
    da_Tk_CreateEventHandler Tk_CreateEventHandler;
    da_Tk_CreateGenericHandler Tk_CreateGenericHandler;
    da_Tk_CreateImageType Tk_CreateImageType;
    da_Tk_CreateItemType Tk_CreateItemType;
    da_Tk_CreateOldImageType Tk_CreateOldImageType;
    da_Tk_CreateOldPhotoImageFormat Tk_CreateOldPhotoImageFormat;
    da_Tk_CreateOptionTable Tk_CreateOptionTable;
    da_Tk_CreateOutline Tk_CreateOutline;
    da_Tk_CreatePhotoImageFormat Tk_CreatePhotoImageFormat;
    da_Tk_CreateSelHandler Tk_CreateSelHandler;
    da_Tk_CreateSmoothMethod Tk_CreateSmoothMethod;
    da_Tk_CreateStyle Tk_CreateStyle;
    da_Tk_CreateWindow Tk_CreateWindow;
    da_Tk_CreateWindowFromPath Tk_CreateWindowFromPath;
    da_Tk_DefineBitmap Tk_DefineBitmap;
    da_Tk_DefineCursor Tk_DefineCursor;
    da_Tk_DeleteAllBindings Tk_DeleteAllBindings;
    da_Tk_DeleteBinding Tk_DeleteBinding;
    da_Tk_DeleteBindingTable Tk_DeleteBindingTable;
    da_Tk_DeleteClientMessageHandler Tk_DeleteClientMessageHandler;
    da_Tk_DeleteErrorHandler Tk_DeleteErrorHandler;
    da_Tk_DeleteEventHandler Tk_DeleteEventHandler;
    da_Tk_DeleteGenericHandler Tk_DeleteGenericHandler;
    da_Tk_DeleteImage Tk_DeleteImage;
    da_Tk_DeleteOptionTable Tk_DeleteOptionTable;
    da_Tk_DeleteOutline Tk_DeleteOutline;
    da_Tk_DeleteSelHandler Tk_DeleteSelHandler;
    da_Tk_DestroyWindow Tk_DestroyWindow;
    da_Tk_DisplayName Tk_DisplayName;
    da_Tk_DistanceToTextLayout Tk_DistanceToTextLayout;
    da_Tk_DitherPhoto Tk_DitherPhoto;
    da_Tk_Draw3DPolygon Tk_Draw3DPolygon;
    da_Tk_Draw3DRectangle Tk_Draw3DRectangle;
    da_Tk_DrawChars Tk_DrawChars;
    da_Tk_DrawElement Tk_DrawElement;
    da_Tk_DrawFocusHighlight Tk_DrawFocusHighlight;
    da_Tk_DrawTextLayout Tk_DrawTextLayout;
    da_Tk_Fill3DPolygon Tk_Fill3DPolygon;
    da_Tk_Fill3DRectangle Tk_Fill3DRectangle;
    da_Tk_FindPhoto Tk_FindPhoto;
    da_Tk_FontId Tk_FontId;
    da_Tk_Free3DBorder Tk_Free3DBorder;
    da_Tk_Free3DBorderFromObj Tk_Free3DBorderFromObj;
    da_Tk_FreeBitmap Tk_FreeBitmap;
    da_Tk_FreeBitmapFromObj Tk_FreeBitmapFromObj;
    da_Tk_FreeColor Tk_FreeColor;
    da_Tk_FreeColorFromObj Tk_FreeColorFromObj;
    da_Tk_FreeColormap Tk_FreeColormap;
    da_Tk_FreeConfigOptions Tk_FreeConfigOptions;
    da_Tk_FreeCursor Tk_FreeCursor;
    da_Tk_FreeCursorFromObj Tk_FreeCursorFromObj;
    da_Tk_FreeFont Tk_FreeFont;
    da_Tk_FreeFontFromObj Tk_FreeFontFromObj;
    da_Tk_FreeGC Tk_FreeGC;
    da_Tk_FreeImage Tk_FreeImage;
    da_Tk_FreeOptions Tk_FreeOptions;
    da_Tk_FreePixmap Tk_FreePixmap;
    da_Tk_FreeSavedOptions Tk_FreeSavedOptions;
    da_Tk_FreeStyle Tk_FreeStyle;
    da_Tk_FreeStyleFromObj Tk_FreeStyleFromObj;
    da_Tk_FreeTextLayout Tk_FreeTextLayout;
    da_Tk_FreeXId Tk_FreeXId;
    da_Tk_GCForColor Tk_GCForColor;
    da_Tk_GeometryRequest Tk_GeometryRequest;
    da_Tk_Get3DBorder Tk_Get3DBorder;
    da_Tk_Get3DBorderFromObj Tk_Get3DBorderFromObj;
    da_Tk_GetAllBindings Tk_GetAllBindings;
    da_Tk_GetAnchor Tk_GetAnchor;
    da_Tk_GetAnchorFromObj Tk_GetAnchorFromObj;
    da_Tk_GetAtomName Tk_GetAtomName;
    da_Tk_GetBinding Tk_GetBinding;
    da_Tk_GetBitmap Tk_GetBitmap;
    da_Tk_GetBitmapFromData Tk_GetBitmapFromData;
    da_Tk_GetBitmapFromObj Tk_GetBitmapFromObj;
    da_Tk_GetCapStyle Tk_GetCapStyle;
    da_Tk_GetColor Tk_GetColor;
    da_Tk_GetColorByValue Tk_GetColorByValue;
    da_Tk_GetColorFromObj Tk_GetColorFromObj;
    da_Tk_GetColormap Tk_GetColormap;
    da_Tk_GetCursor Tk_GetCursor;
    da_Tk_GetCursorFromData Tk_GetCursorFromData;
    da_Tk_GetCursorFromObj Tk_GetCursorFromObj;
    da_Tk_GetDash Tk_GetDash;
    da_Tk_GetElementBorderWidth Tk_GetElementBorderWidth;
    da_Tk_GetElementBox Tk_GetElementBox;
    da_Tk_GetElementId Tk_GetElementId;
    da_Tk_GetElementSize Tk_GetElementSize;
    da_Tk_GetFont Tk_GetFont;
    da_Tk_GetFontFromObj Tk_GetFontFromObj;
    da_Tk_GetFontMetrics Tk_GetFontMetrics;
    da_Tk_GetGC Tk_GetGC;
    // da_Tk_GetHINSTANCE Tk_GetHINSTANCE;
    // da_Tk_GetHWND Tk_GetHWND;
    da_Tk_GetImage Tk_GetImage;
    da_Tk_GetImageMasterData Tk_GetImageMasterData;
    da_Tk_GetItemTypes Tk_GetItemTypes;
    da_Tk_GetJoinStyle Tk_GetJoinStyle;
    da_Tk_GetJustify Tk_GetJustify;
    da_Tk_GetJustifyFromObj Tk_GetJustifyFromObj;
    da_Tk_GetMMFromObj Tk_GetMMFromObj;
    da_Tk_GetNumMainWindows Tk_GetNumMainWindows;
    da_Tk_GetOption Tk_GetOption;
    da_Tk_GetOptionInfo Tk_GetOptionInfo;
    da_Tk_GetOptionValue Tk_GetOptionValue;
    da_Tk_GetPixels Tk_GetPixels;
    da_Tk_GetPixelsFromObj Tk_GetPixelsFromObj;
    da_Tk_GetPixmap Tk_GetPixmap;
    da_Tk_GetRelief Tk_GetRelief;
    da_Tk_GetReliefFromObj Tk_GetReliefFromObj;
    da_Tk_GetRootCoords Tk_GetRootCoords;
    da_Tk_GetScreenMM Tk_GetScreenMM;
    da_Tk_GetScrollInfo Tk_GetScrollInfo;
    da_Tk_GetScrollInfoObj Tk_GetScrollInfoObj;
    da_Tk_GetSelection Tk_GetSelection;
    da_Tk_GetStyle Tk_GetStyle;
    da_Tk_GetStyleEngine Tk_GetStyleEngine;
    da_Tk_GetStyleFromObj Tk_GetStyleFromObj;
    da_Tk_GetStyledElement Tk_GetStyledElement;
    da_Tk_GetUid Tk_GetUid;
    da_Tk_GetUserInactiveTime Tk_GetUserInactiveTime;
    da_Tk_GetVRootGeometry Tk_GetVRootGeometry;
    da_Tk_GetVisual Tk_GetVisual;
    da_Tk_Grab Tk_Grab;
    // da_Tk_HWNDToWindow Tk_HWNDToWindow;
    da_Tk_HandleEvent Tk_HandleEvent;
    da_Tk_IdToWindow Tk_IdToWindow;
    da_Tk_ImageChanged Tk_ImageChanged;
    da_Tk_Init Tk_Init;
    da_Tk_InitConsoleChannels Tk_InitConsoleChannels;
    da_Tk_InitOptions Tk_InitOptions;
    da_Tk_InternAtom Tk_InternAtom;
    da_Tk_Interp Tk_Interp;
    da_Tk_IntersectTextLayout Tk_IntersectTextLayout;
    da_Tk_MainEx Tk_MainEx;
    // da_Tk_MainExW Tk_MainExW;
    da_Tk_MainLoop Tk_MainLoop;
    da_Tk_MainWindow Tk_MainWindow;
    da_Tk_MaintainGeometry Tk_MaintainGeometry;
    da_Tk_MakeWindowExist Tk_MakeWindowExist;
    da_Tk_ManageGeometry Tk_ManageGeometry;
    da_Tk_MapWindow Tk_MapWindow;
    da_Tk_MeasureChars Tk_MeasureChars;
    da_Tk_MoveResizeWindow Tk_MoveResizeWindow;
    da_Tk_MoveToplevelWindow Tk_MoveToplevelWindow;
    da_Tk_MoveWindow Tk_MoveWindow;
    da_Tk_NameOf3DBorder Tk_NameOf3DBorder;
    da_Tk_NameOfAnchor Tk_NameOfAnchor;
    da_Tk_NameOfBitmap Tk_NameOfBitmap;
    da_Tk_NameOfCapStyle Tk_NameOfCapStyle;
    da_Tk_NameOfColor Tk_NameOfColor;
    da_Tk_NameOfCursor Tk_NameOfCursor;
    da_Tk_NameOfFont Tk_NameOfFont;
    da_Tk_NameOfImage Tk_NameOfImage;
    da_Tk_NameOfJoinStyle Tk_NameOfJoinStyle;
    da_Tk_NameOfJustify Tk_NameOfJustify;
    da_Tk_NameOfRelief Tk_NameOfRelief;
    da_Tk_NameOfStyle Tk_NameOfStyle;
    da_Tk_NameToWindow Tk_NameToWindow;
    da_Tk_OwnSelection Tk_OwnSelection;
    da_Tk_ParseArgv Tk_ParseArgv;
    da_Tk_PhotoBlank Tk_PhotoBlank;
    da_Tk_PhotoExpand Tk_PhotoExpand;
    da_Tk_PhotoExpand_Panic Tk_PhotoExpand_Panic;
    da_Tk_PhotoGetImage Tk_PhotoGetImage;
    da_Tk_PhotoGetSize Tk_PhotoGetSize;
    da_Tk_PhotoPutBlock Tk_PhotoPutBlock;
    da_Tk_PhotoPutBlock_NoComposite Tk_PhotoPutBlock_NoComposite;
    da_Tk_PhotoPutBlock_Panic Tk_PhotoPutBlock_Panic;
    da_Tk_PhotoPutZoomedBlock Tk_PhotoPutZoomedBlock;
    da_Tk_PhotoPutZoomedBlock_NoComposite Tk_PhotoPutZoomedBlock_NoComposite;
    da_Tk_PhotoPutZoomedBlock_Panic Tk_PhotoPutZoomedBlock_Panic;
    da_Tk_PhotoSetSize Tk_PhotoSetSize;
    da_Tk_PhotoSetSize_Panic Tk_PhotoSetSize_Panic;
    // da_Tk_PkgInitStubsCheck Tk_PkgInitStubsCheck;
    da_Tk_PointToChar Tk_PointToChar;
    // da_Tk_PointerEvent Tk_PointerEvent;
    da_Tk_PostscriptBitmap Tk_PostscriptBitmap;
    da_Tk_PostscriptColor Tk_PostscriptColor;
    da_Tk_PostscriptFont Tk_PostscriptFont;
    da_Tk_PostscriptFontName Tk_PostscriptFontName;
    da_Tk_PostscriptImage Tk_PostscriptImage;
    da_Tk_PostscriptPath Tk_PostscriptPath;
    da_Tk_PostscriptPhoto Tk_PostscriptPhoto;
    da_Tk_PostscriptStipple Tk_PostscriptStipple;
    da_Tk_PostscriptY Tk_PostscriptY;
    da_Tk_PreserveColormap Tk_PreserveColormap;
    da_Tk_QueueWindowEvent Tk_QueueWindowEvent;
    da_Tk_RedrawImage Tk_RedrawImage;
    da_Tk_RegisterStyleEngine Tk_RegisterStyleEngine;
    da_Tk_RegisterStyledElement Tk_RegisterStyledElement;
    da_Tk_ResetOutlineGC Tk_ResetOutlineGC;
    da_Tk_ResetUserInactiveTime Tk_ResetUserInactiveTime;
    da_Tk_ResizeWindow Tk_ResizeWindow;
    da_Tk_RestackWindow Tk_RestackWindow;
    da_Tk_RestoreSavedOptions Tk_RestoreSavedOptions;
    da_Tk_RestrictEvents Tk_RestrictEvents;
    da_Tk_SafeInit Tk_SafeInit;
    da_Tk_SetAppName Tk_SetAppName;
    da_Tk_SetBackgroundFromBorder Tk_SetBackgroundFromBorder;
    da_Tk_SetCaretPos Tk_SetCaretPos;
    da_Tk_SetClass Tk_SetClass;
    da_Tk_SetClassProcs Tk_SetClassProcs;
    da_Tk_SetGrid Tk_SetGrid;
    da_Tk_SetInternalBorder Tk_SetInternalBorder;
    da_Tk_SetInternalBorderEx Tk_SetInternalBorderEx;
    da_Tk_SetMinimumRequestSize Tk_SetMinimumRequestSize;
    da_Tk_SetOptions Tk_SetOptions;
    da_Tk_SetTSOrigin Tk_SetTSOrigin;
    da_Tk_SetWindowBackground Tk_SetWindowBackground;
    da_Tk_SetWindowBackgroundPixmap Tk_SetWindowBackgroundPixmap;
    da_Tk_SetWindowBorder Tk_SetWindowBorder;
    da_Tk_SetWindowBorderPixmap Tk_SetWindowBorderPixmap;
    da_Tk_SetWindowBorderWidth Tk_SetWindowBorderWidth;
    da_Tk_SetWindowColormap Tk_SetWindowColormap;
    da_Tk_SetWindowVisual Tk_SetWindowVisual;
    da_Tk_SizeOfBitmap Tk_SizeOfBitmap;
    da_Tk_SizeOfImage Tk_SizeOfImage;
    da_Tk_StrictMotif Tk_StrictMotif;
    da_Tk_TextLayoutToPostscript Tk_TextLayoutToPostscript;
    da_Tk_TextWidth Tk_TextWidth;
    // da_Tk_TranslateWinEvent Tk_TranslateWinEvent;
    da_Tk_UndefineCursor Tk_UndefineCursor;
    da_Tk_UnderlineChars Tk_UnderlineChars;
    da_Tk_UnderlineTextLayout Tk_UnderlineTextLayout;
    da_Tk_Ungrab Tk_Ungrab;
    da_Tk_UnmaintainGeometry Tk_UnmaintainGeometry;
    da_Tk_UnmapWindow Tk_UnmapWindow;
    da_Tk_UnsetGrid Tk_UnsetGrid;
    da_Tk_UpdatePointer Tk_UpdatePointer;
}

//==============================================================================
//
// MACROS
//
//==============================================================================
@nogc nothrow
void Tk_Main(int argc, char** argv, Tcl_AppInitProc proc)
{
    Tcl_FindExecutable(argv[0]);
    Tk_MainEx(argc, argv, proc, Tcl_CreateInterp());
}
