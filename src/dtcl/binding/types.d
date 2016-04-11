module dtcl.bindings.types;

//==============================================================================
//
// PODs
//
//==============================================================================
alias Tcl_WideInt = long;
alias Tcl_WideUInt = ulong;
alias ClientData = void*;
alias Tcl_UniChar = wchar;

struct Tcl_Interp
{
    char* result;
    Tcl_FreeProc* freeProc;
    int errorLine;
}

struct Tcl_Obj
{
    int refCount;
    char* bytes;
    int length;
    const Tcl_ObjType* typePtr;
    union internalRep
    {
        int longValue;
        double doubleValue;
        void* otherValuePtr;
        Tcl_WideInt wideValue;
        struct twoPtrValue
        {
            void* ptr1;
            void* ptr2;
        }
        struct ptrAndLongRep
        {
            void *ptr;
            uint value;
        }
    }
}

struct Tcl_ObjType
{
    const(char)* name;
    Tcl_FreeInternalRepProc freeIntRepProc;
    Tcl_DupInternalRepProc dupIntRepProc;
    Tcl_UpdateStringProc updateStringProc;
    Tcl_SetFromAnyProc setFromAnyProc;
}

enum Tcl_ValueType
{
    TCL_INT, TCL_DOUBLE, TCL_EITHER, TCL_WIDE_INT
}

struct Tcl_Value
{
    Tcl_ValueType type;
    int intValue;
    double doubleValue;
    Tcl_WideInt wideValue;
}

struct Tcl_Time
{
    int sec;
    int usec;
}

struct Tcl_Event
{
    Tcl_EventProc* proc;
    Tcl_Event* nextPtr;
}

struct Tcl_NotifierProcs
{
    Tcl_SetTimerProc setTimerProc;
    Tcl_WaitForEventProc waitForEventProc;
    Tcl_CreateFileHandlerProc createFileHandlerProc;
    Tcl_DeleteFileHandlerProc deleteFileHandlerProc;
    Tcl_InitNotifierProc initNotifierProc;
    Tcl_FinalizeNotifierProc finalizeNotifierProc;
    Tcl_AlertNotifierProc alertNotifierProc;
    Tcl_ServiceModeHookProc serviceModeHookProc;
}

struct Tcl_ChannelType
{
    const(char)*typeName;
    Tcl_ChannelTypeVersion _version;
    Tcl_DriverCloseProc* closeProc;
    Tcl_DriverInputProc* inputProc;
    Tcl_DriverOutputProc* outputProc;
    Tcl_DriverSeekProc* seekProc;
    Tcl_DriverSetOptionProc* setOptionProc;
    Tcl_DriverGetOptionProc* getOptionProc;
    Tcl_DriverWatchProc* watchProc;
    Tcl_DriverGetHandleProc* getHandleProc;
    Tcl_DriverClose2Proc* close2Proc;
    Tcl_DriverBlockModeProc* blockModeProc;
    Tcl_DriverFlushProc* flushProc;
    Tcl_DriverHandlerProc* handlerProc;
    Tcl_DriverWideSeekProc* wideSeekProc;
    Tcl_DriverThreadActionProc* threadActionProc;
    Tcl_DriverTruncateProc* truncateProc;
}

enum TCL_DSTRING_STATIC_SIZE = 200;
struct Tcl_DString
{
    char* str;
    int length;
    int spaceAvl;
    char[TCL_DSTRING_STATIC_SIZE] staticSpace;
};

struct Tcl_HashEntry
{
    Tcl_HashEntry* nextPtr;
    Tcl_HashTable* tablePtr;
    Tcl_HashEntry** bucketPtr;
    ClientData clientData;
    union key
    {
        char *oneWordValue;
        Tcl_Obj *objPtr;
        int words[1];
        char[1] str;
    }
}

enum TCL_SMALL_HASH_TABLE = 4;
struct Tcl_HashTable
{
    Tcl_HashEntry** buckets;
    Tcl_HashEntry*[TCL_SMALL_HASH_TABLE] staticBuckets;
    int numBuckets;
    int numEntries;
    int rebuildSize;
    int downShift;
    int mask;
    int keyType;

    Tcl_HashEntry* function(Tcl_HashTable* tablePtr, const(char)* key) findProc;
    Tcl_HashEntry* function(Tcl_HashTable* tablePtr, const(char)*key,
                            int *newPtr) createProc;
    const(Tcl_HashKeyType)* typePtr;
}

enum TCL_HASH_KEY_TYPE_VERSION = 1;
struct Tcl_HashKeyType
{
    int ver;
    int flags;
    Tcl_HashKeyProc *hashKeyProc;
    Tcl_CompareHashKeysProc* compareKeysProc;
    Tcl_AllocHashEntryProc* allocEntryProc;
    Tcl_FreeHashEntryProc* freeEntryProc;
}

struct Tcl_HashSearch
{
    Tcl_HashTable* tablePtr;
    int nextIndex;
    Tcl_HashEntry* nextEntryPtr;
}

struct Tcl_CmdInfo
{
    int isNativeObjectProc;
    Tcl_ObjCmdProc* objProc;
    ClientData objClientData;
    Tcl_CmdProc* proc;
    ClientData clientData;
    Tcl_CmdDeleteProc* deleteProc;
    ClientData deleteData;
    Tcl_Namespace* namespacePtr;
}

struct Tcl_Namespace
{
    char* name;
    char* fullName;
    ClientData clientData;
    Tcl_NamespaceDeleteProc* deleteProc;
    Tcl_Namespace* parentPtr;
}


struct Tcl_EncodingType
{
    const(char)*encodingName;
    Tcl_EncodingConvertProc* toUtfProc;
    Tcl_EncodingConvertProc* fromUtfProc;
    Tcl_EncodingFreeProc* freeProc;
    ClientData clientData;
    int nullSize;
}

struct Tcl_SavedResult
{
    char* result;
    Tcl_FreeProc* freeProc;
    Tcl_Obj* objResultPtr;
    char* appendResult;
    int appendAvl;
    int appendUsed;
    char[TCL_RESULT_SIZE+1] resultSpace;
}

struct Tcl_Token
{
    int type;
    const(char)*start;
    int size;
    int numComponents;
}

enum NUM_STATIC_TOKENS = 20;
struct Tcl_Parse
{
    const(char)* commentStart;
    int commentSize;
    const(char)* commandStart;
    int commandSize;
    int numWords;
    Tcl_Token* tokenPtr;
    int numTokens;
    int tokensAvailable;
    int errorType;
    const(char)* str;
    const(char)* end;
    Tcl_Interp* interp;
    const(char)* term;
    int incomplete;
    Tcl_Token[NUM_STATIC_TOKENS] staticTokens;
}

struct Tcl_RegExpInfo
{
    int nsubs;
    Tcl_RegExpIndices* matches;
    int extendStart;
    int reserved;
}

struct Tcl_RegExpIndices
{
    int start;
    int end;
}

struct Tcl_GlobTypeData
{
    int type;
    int perm;
    Tcl_Obj* macType;
    Tcl_Obj* macCreator;
}

struct Tcl_Filesystem
{
    const(char)* typeName;
    int structureLength;
    Tcl_FSVersion ver;
    Tcl_FSPathInFilesystemProc* pathInFilesystemProc;
    Tcl_FSDupInternalRepProc* dupInternalRepProc;
    Tcl_FSFreeInternalRepProc* freeInternalRepProc;
    Tcl_FSInternalToNormalizedProc* internalToNormalizedProc;
    Tcl_FSCreateInternalRepProc* createInternalRepProc;
    Tcl_FSNormalizePathProc* normalizePathProc;
    Tcl_FSFilesystemPathTypeProc* filesystemPathTypeProc;
    Tcl_FSFilesystemSeparatorProc* filesystemSeparatorProc;
    Tcl_FSStatProc* statProc;
    Tcl_FSAccessProc* accessProc;
    Tcl_FSOpenFileChannelProc* openFileChannelProc;
    Tcl_FSMatchInDirectoryProc* matchInDirectoryProc;
    Tcl_FSUtimeProc* utimeProc;
    Tcl_FSLinkProc* linkProc;
    Tcl_FSListVolumesProc* listVolumesProc;
    Tcl_FSFileAttrStringsProc* fileAttrStringsProc;
    Tcl_FSFileAttrsGetProc* fileAttrsGetProc;
    Tcl_FSFileAttrsSetProc* fileAttrsSetProc;
    Tcl_FSCreateDirectoryProc* createDirectoryProc;
    Tcl_FSRemoveDirectoryProc* removeDirectoryProc;
    Tcl_FSDeleteFileProc* deleteFileProc;
    Tcl_FSCopyFileProc* copyFileProc;
    Tcl_FSRenameFileProc* renameFileProc;
    Tcl_FSCopyDirectoryProc* copyDirectoryProc;
    Tcl_FSLstatProc* lstatProc;
    Tcl_FSLoadFileProc* loadFileProc;
    Tcl_FSGetCwdProc* getCwdProc;
    Tcl_FSChdirProc* chdirProc;
}

struct Tcl_DictSearch
{
    void *next;
    int epoch;
    Tcl_Dict dictionaryPtr;
}

struct Tcl_Config
{
    const(char)* key;
    const(char)* value;
}

struct Tcl_ArgvInfo
{
    int type;
    const(char)* keyStr;
    void* srcPtr;
    void* dstPtr;
    const(char)* helpStr;
    ClientData clientData;
}





//==============================================================================
//
// Opaque types
//
//==============================================================================
version (Windows)
{
    import core.sys.windows.stat : struct_stat;
    alias stat = struct_stat;
    alias Tcl_StatBuf = struct_stat;
}
else static assert(0);

struct Tcl_AsyncHandler_{}
alias Tcl_AsyncHandler = Tcl_AsyncHandler_*;
struct Tcl_Channel_{}
alias Tcl_Channel = Tcl_Channel_*;
struct Tcl_ChannelTypeVersion_{}
alias Tcl_ChannelTypeVersion = Tcl_ChannelTypeVersion_*;
struct Tcl_Command_{}
alias Tcl_Command = Tcl_Command_*;
struct Tcl_Condition_{}
alias Tcl_Condition = Tcl_Condition_*;
struct Tcl_Dict_{}
alias Tcl_Dict = Tcl_Dict_*;
struct Tcl_EncodingState_{}
alias Tcl_EncodingState = Tcl_EncodingState_*;
struct Tcl_Encoding_{}
alias Tcl_Encoding = Tcl_Encoding_*;
struct Tcl_InterpState_{}
alias Tcl_InterpState = Tcl_InterpState_*;
struct Tcl_LoadHandle_{}
alias Tcl_LoadHandle = Tcl_LoadHandle_*;
struct Tcl_Mutex_{}
alias Tcl_Mutex = Tcl_Mutex_*;
struct Tcl_Pid_{}
alias Tcl_Pid = Tcl_Pid_*;
struct Tcl_RegExp_{}
alias Tcl_RegExp = Tcl_RegExp_*;
struct Tcl_ThreadDataKey_{}
alias Tcl_ThreadDataKey = Tcl_ThreadDataKey_*;
struct Tcl_ThreadId_{}
alias Tcl_ThreadId = Tcl_ThreadId_*;
struct Tcl_TimerToken_{}
alias Tcl_TimerToken = Tcl_TimerToken_*;
struct Tcl_Trace_{}
alias Tcl_Trace = Tcl_Trace_*;
struct Tcl_Var_{}
alias Tcl_Var = Tcl_Var_*;
struct Tcl_ZLibStream_{}
alias Tcl_ZlibStream = Tcl_ZLibStream_*;

struct utimbuf{}
struct Tcl_FSVersion_{}
alias Tcl_FSVersion = Tcl_FSVersion_*;

struct mp_int{}
alias mp_digit = uint;


//==============================================================================
//
// procedures
//
//==============================================================================
extern(C) nothrow
{
    alias Tcl_AppInitProc = int function(Tcl_Interp* interp);
    alias Tcl_AsyncProc =
        int function(ClientData clientData, Tcl_Interp* interp, int code);
    alias Tcl_ChannelProc = void function(ClientData clientData, int mask);
    alias Tcl_CloseProc = void function(ClientData data);
    alias Tcl_CmdDeleteProc = void function(ClientData clientData);
    alias Tcl_CmdProc =
        int function(ClientData clientData, Tcl_Interp* interp, int argc,
                     const(char)** argv);
    alias Tcl_CmdTraceProc =
        void function(ClientData clientData, Tcl_Interp* interp, int level,
                      char* command, Tcl_CmdProc* proc,
                      ClientData cmdClientData, int argc, const(char)** argv);
    alias Tcl_CmdObjTraceProc =
        int function(ClientData clientData, Tcl_Interp* interp, int level,
                     const(char)* command, Tcl_Command commandInfo, int objc,
                     const(Tcl_Obj*)* objv);
    alias Tcl_CmdObjTraceDeleteProc = void function(ClientData clientData);
    alias Tcl_DupInternalRepProc =
        void function(Tcl_Obj* srcPtr, Tcl_Obj* dupPtr);
    alias Tcl_EncodingConvertProc =
        int function(ClientData clientData, const(char)* src, int srcLen,
                     int flags, Tcl_EncodingState* statePtr, char* dst,
                     int dstLen, int* srcReadPtr, int* dstWrotePtr,
                     int* dstCharsPtr);
    alias Tcl_EncodingFreeProc = void function(ClientData clientData);
    alias Tcl_EventProc = int function(Tcl_Event* evPtr, int flags);
    alias Tcl_EventCheckProc = void function(ClientData clientData, int flags);
    alias Tcl_EventDeleteProc =
        int function(Tcl_Event* evPtr, ClientData clientData);
    alias Tcl_EventSetupProc = void function(ClientData clientData, int flags);
    alias Tcl_ExitProc = void function(ClientData clientData);
    alias Tcl_FileProc = void function(ClientData clientData, int mask);
    alias Tcl_FileFreeProc = void function(ClientData clientData);
    alias Tcl_FreeInternalRepProc = void function(Tcl_Obj* objPtr);
    alias Tcl_FreeProc = void function(char* blockPtr);
    alias Tcl_IdleProc = void function(ClientData clientData);
    alias Tcl_InterpDeleteProc =
        void function(ClientData clientData, Tcl_Interp* interp);
    alias Tcl_MathProc =
        int function(ClientData clientData, Tcl_Interp* interp, Tcl_Value* args,
                     Tcl_Value* resultPtr);
    alias Tcl_NamespaceDeleteProc = void function(ClientData clientData);
    alias Tcl_ObjCmdProc =
        int function(ClientData clientData, Tcl_Interp* interp, int objc,
                     Tcl_Obj** objv);
    alias Tcl_PackageInitProc = int function(Tcl_Interp* interp);
    alias Tcl_PackageUnloadProc = int function(Tcl_Interp* interp, int flags);
    alias Tcl_PanicProc = void function(const char* format, ...);
    alias Tcl_TcpAcceptProc =
        void function(ClientData callbackData, Tcl_Channel chan, char* address,
                      int port);
    alias Tcl_TimerProc = void function(ClientData clientData);
    alias Tcl_SetFromAnyProc =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias Tcl_UpdateStringProc = void function(Tcl_Obj* objPtr);
    alias Tcl_VarTraceProc =
        char* function(ClientData clientData, Tcl_Interp* interp,
                       const(char)* part1, const(char)* part2, int flags);
    alias Tcl_CommandTraceProc =
        void function(ClientData clientData, Tcl_Interp* interp,
                      const(char)* oldName, const(char)* newName, int flags);
    alias Tcl_CreateFileHandlerProc =
        void function(int fd, int mask, Tcl_FileProc* proc,
                      ClientData clientData);
    alias Tcl_DeleteFileHandlerProc = void function(int fd);
    alias Tcl_AlertNotifierProc = void function(ClientData clientData);
    alias Tcl_ServiceModeHookProc = void function(int mode);
    alias Tcl_InitNotifierProc = ClientData function();
    alias Tcl_FinalizeNotifierProc = void function(ClientData clientData);
    alias Tcl_MainLoopProc = void function();


    //--------------------------------------------------------------------
    alias Tcl_SetTimerProc = void function(const(Tcl_Time)* timePtr);
    alias Tcl_WaitForEventProc = int function(const(Tcl_Time)* timePtr);

    alias Tcl_GetTimeProc =
        void function(Tcl_Time* timebuf, ClientData clientData);
    alias Tcl_ScaleTimeProc =
        void function(Tcl_Time* timebuf, ClientData clientData);



    //--------------------------------------------------------------------
    alias Tcl_DriverBlockModeProc =
        int function(ClientData instanceData, int mode);
    alias Tcl_DriverCloseProc =
        int function(ClientData instanceData, Tcl_Interp* interp);
    alias Tcl_DriverClose2Proc =
        int function(ClientData instanceData, Tcl_Interp* interp, int flags);
    alias Tcl_DriverInputProc =
        int function(ClientData instanceData, char* buf, int toRead,
                     int* errorCodePtr);
    alias Tcl_DriverOutputProc =
        int function(ClientData instanceData, const(char)* buf,
                     int toWrite, int* errorCodePtr);
    alias Tcl_DriverSeekProc =
        int function(ClientData instanceData, long offset, int mode,
                     int* errorCodePtr);
    alias Tcl_DriverSetOptionProc =
        int function(ClientData instanceData, Tcl_Interp* interp,
                     const(char)* optionName, const(char)* value);
    alias Tcl_DriverGetOptionProc =
        int function(ClientData instanceData, Tcl_Interp* interp,
                     const(char)* optionName, Tcl_DString* dsPtr);
    alias Tcl_DriverWatchProc =
        void function(ClientData instanceData, int mask);
    alias Tcl_DriverGetHandleProc =
        int function(ClientData instanceData, int direction,
                     ClientData* handlePtr);
    alias Tcl_DriverFlushProc = int function(ClientData instanceData);
    alias Tcl_DriverHandlerProc =
        int function(ClientData instanceData, int interestMask);
    alias Tcl_DriverWideSeekProc =
        Tcl_WideInt function(ClientData instanceData, Tcl_WideInt offset,
                             int mode, int* errorCodePtr);
    alias Tcl_DriverThreadActionProc =
        void function(ClientData instanceData, int action);
    alias Tcl_DriverTruncateProc =
        int function(ClientData instanceData, Tcl_WideInt length);

    //--------------------------------------------------------------------
    alias Tcl_HashKeyProc =
        uint function(Tcl_HashTable* tablePtr, void* keyPtr);
    alias Tcl_CompareHashKeysProc =
        int function(void* keyPtr, Tcl_HashEntry* hPtr);
    alias Tcl_AllocHashEntryProc =
        Tcl_HashEntry* function(Tcl_HashTable* tablePtr, void* keyPtr);
    alias Tcl_FreeHashEntryProc = void function(Tcl_HashEntry* hPtr);

    //--------------------------------------------------------------------
    alias Tcl_ThreadCreateProc = uint function(ClientData clientData);


    //--------------------------------------------------------------------
    alias Tcl_FSStatProc = int function(Tcl_Obj* pathPtr, Tcl_StatBuf* buf);
    alias Tcl_FSAccessProc = int function(Tcl_Obj* pathPtr, int mode);
    alias Tcl_FSOpenFileChannelProc =
        Tcl_Channel function(Tcl_Interp* interp, Tcl_Obj* pathPtr,
                             int mode, int permissions);
    alias Tcl_FSMatchInDirectoryProc =
        int function(Tcl_Interp* interp, Tcl_Obj* result, Tcl_Obj* pathPtr,
                     const(char)* pattern, Tcl_GlobTypeData* types);
    alias Tcl_FSGetCwdProc = Tcl_Obj*  function(Tcl_Interp* interp);
    alias Tcl_FSChdirProc = int function(Tcl_Obj* pathPtr);
    alias Tcl_FSLstatProc = int function(Tcl_Obj* pathPtr, Tcl_StatBuf* buf);
    alias Tcl_FSCreateDirectoryProc = int function(Tcl_Obj* pathPtr);
    alias Tcl_FSDeleteFileProc = int function(Tcl_Obj* pathPtr);
    alias Tcl_FSCopyDirectoryProc =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr,
                     Tcl_Obj** errorPtr);
    alias Tcl_FSCopyFileProc =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr);
    alias Tcl_FSRemoveDirectoryProc =
        int function(Tcl_Obj* pathPtr, int recursive, Tcl_Obj** errorPtr);
    alias Tcl_FSRenameFileProc =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr);
    alias Tcl_FSUnloadFileProc = void function(Tcl_LoadHandle loadHandle);
    alias Tcl_FSListVolumesProc = Tcl_Obj* function();

    alias Tcl_FSUtimeProc = int function(Tcl_Obj* pathPtr, utimbuf* tval);
    alias Tcl_FSNormalizePathProc =
        int function(Tcl_Interp* interp, Tcl_Obj* pathPtr, int nextCheckpoint);
    alias Tcl_FSFileAttrsGetProc =
        int function(Tcl_Interp* interp, int index, Tcl_Obj* pathPtr,
                     Tcl_Obj** objPtrRef);
    alias Tcl_FSFileAttrStringsProc =
        const(const(char)*)* function(Tcl_Obj* pathPtr, Tcl_Obj** objPtrRef);
    alias Tcl_FSFileAttrsSetProc =
        int function(Tcl_Interp* interp, int index, Tcl_Obj* pathPtr,
                     Tcl_Obj* objPtr);
    alias Tcl_FSLinkProc =
        Tcl_Obj* function(Tcl_Obj* pathPtr, Tcl_Obj* toPtr, int linkType);
    alias Tcl_FSLoadFileProc =
        int function(Tcl_Interp* interp, Tcl_Obj* pathPtr,
                     Tcl_LoadHandle* handlePtr,
                     Tcl_FSUnloadFileProc** unloadProcPtr);
    alias Tcl_FSPathInFilesystemProc =
        int function(Tcl_Obj* pathPtr, ClientData* clientDataPtr);
    alias Tcl_FSFilesystemPathTypeProc = Tcl_Obj*  function(Tcl_Obj* pathPtr);
    alias Tcl_FSFilesystemSeparatorProc = Tcl_Obj*  function(Tcl_Obj* pathPtr);
    alias Tcl_FSFreeInternalRepProc = void function(ClientData clientData);
    alias Tcl_FSDupInternalRepProc = ClientData function(ClientData clientData);
    alias Tcl_FSInternalToNormalizedProc =
        Tcl_Obj* function(ClientData clientData);
    alias Tcl_FSCreateInternalRepProc = ClientData function(Tcl_Obj* pathPtr);


    //--------------------------------------------------------------------
    alias Tcl_LimitHandlerProc =
        void function(ClientData clientData, Tcl_Interp* interp);
    alias Tcl_LimitHandlerDeleteProc =
        void function(ClientData clientData);

    //--------------------------------------------------------------------
    alias Tcl_NRPostProc =
        int function (ClientData* data, Tcl_Interp* interp, int result);
}

//==============================================================================
//
// enums
//
//==============================================================================
enum TCL_OK          = 0;
enum TCL_ERROR       = 1;
enum TCL_RETURN      = 2;
enum TCL_BREAK       = 3;
enum TCL_CONTINUE    = 4;

enum TCL_RESULT_SIZE = 200;


enum TCL_GLOBAL_ONLY          = 1;
enum TCL_NAMESPACE_ONLY       = 2;
enum TCL_APPEND_VALUE         = 4;
enum TCL_LIST_ELEMENT         = 8;
enum TCL_TRACE_READS          = 0x10;
enum TCL_TRACE_WRITES         = 0x20;
enum TCL_TRACE_UNSETS         = 0x40;
enum TCL_TRACE_DESTROYED      = 0x80;
enum TCL_INTERP_DESTROYED     = 0x100;
enum TCL_LEAVE_ERR_MSG        = 0x200;
enum TCL_TRACE_ARRAY          = 0x800;
enum TCL_TRACE_OLD_STYLE      = 0x1000;
enum TCL_TRACE_RESULT_DYNAMIC = 0x8000;
enum TCL_TRACE_RESULT_OBJECT  = 0x10000;

enum TCL_NO_EVAL           = 0x010000;
enum TCL_EVAL_GLOBAL       = 0x020000;
enum TCL_EVAL_DIRECT       = 0x040000;
enum TCL_EVAL_INVOKE       = 0x080000;
enum TCL_CANCEL_UNWIND     = 0x100000;
enum TCL_EVAL_NOERR        = 0x200000;


enum Tcl_QueuePosition
{
    TCL_QUEUE_TAIL,
    TCL_QUEUE_HEAD,
    TCL_QUEUE_MARK,
}

enum Tcl_PathType
{
    TCL_PATH_ABSOLUTE,
    TCL_PATH_RELATIVE,
    TCL_PATH_VOLUME_RELATIVE
}

enum TCL_SUBST_COMMANDS    = 1;
enum TCL_SUBST_VARIABLES   = 2;
enum TCL_SUBST_BACKSLASHES = 4;
enum TCL_SUBST_ALL         = 7;
