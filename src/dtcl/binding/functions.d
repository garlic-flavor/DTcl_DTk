/**
References:
$(LINK2 http://www.tcl.tk/man/tcl8.6/TclLib/contents.htm, Tcl C API)
 **/
module dtcl.binding.functions;

private import dtcl.binding.types;
private import core.stdc.stdarg : va_list;

//==============================================================================
//
// External
//
//==============================================================================
extern(C) @trusted @nogc nothrow
{
    alias da_Tcl_PkgProvideEx =
        int function(Tcl_Interp* interp, const(char)* name,
                     const(char)* ver, const(void)* clientData);
    alias da_Tcl_PkgRequireEx =
        const(char)* function(Tcl_Interp* interp, const(char)* name,
                              const(char)* ver, int exact,
                              void* clientDataPtr);
    alias da_Tcl_Panic = void function(const(char)* format, ...);
    alias da_Tcl_Alloc = void* function(uint size);
    alias da_Tcl_Free =  void function(void* ptr);
    alias da_Tcl_Realloc =  char* function(char* ptr, uint size);
    alias da_Tcl_DbCkalloc =
        char* function(uint size, const(char)* file, int line);
    alias da_Tcl_DbCkfree =
        void function(char* ptr, const(char)* file, int line);
    alias da_Tcl_DbCkrealloc =
        char* function(char* ptr, uint size, const(char)* file, int line);

    version      (linux)
    {
        alias da_Tcl_CreateFileHandler =
            void function(int fd, int mask, Tcl_FileProc proc,
                          ClientData clientData);
    }
    else version (mac)
    {
        alias da_Tcl_CreateFileHandler =
            void function(int fd, int mask, Tcl_FileProc proc,
                          ClientData clientData);
    }

    version      (linux)
    {
        alias da_Tcl_DeleteFileHandler =  void function(int fd);
    }
    else version (mac)
    {
        alias da_Tcl_DeleteFileHandler =  void function(int fd);
    }

    alias da_Tcl_SetTimer = void function(const(Tcl_Time)* timePtr);
    alias da_Tcl_Sleep = void function(int ms);
    alias da_Tcl_WaitForEvent = int function(const(Tcl_Time)* timePtr);
    alias da_Tcl_AppendAllObjTypes =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tcl_AppendStringsToObj = void function(Tcl_Obj* objPtr, ...);
    alias da_Tcl_AppendToObj =
        void function(Tcl_Obj* objPtr, const(char)* bytes, int length);
    alias da_Tcl_ConcatObj =
        Tcl_Obj* function(int objc, const(Tcl_Obj)** objv);
    alias da_Tcl_ConvertToType =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     const(Tcl_ObjType)* typePtr);
    alias da_Tcl_DbDecrRefCount =
        void function(Tcl_Obj* objPtr, const(char)* file, int line);
    alias da_Tcl_DbIncrRefCount =
        void function(Tcl_Obj* objPtr, const(char)* file, int line);
    alias da_Tcl_DbIsShared =
        int function(Tcl_Obj* objPtr, const(char)* file, int line);
    alias da_Tcl_DbNewBooleanObj =
        Tcl_Obj* function(int boolValue, const(char)* file, int line);
    alias da_Tcl_DbNewByteArrayObj =
        Tcl_Obj* function(const(ubyte)* bytes, int length,
                          const(char)* file, int line);
    alias da_Tcl_DbNewDoubleObj =
        Tcl_Obj* function(double doubleValue, const(char)* file, int line);
    alias da_Tcl_DbNewListObj =
        Tcl_Obj* function(int objc, const(Tcl_Obj*)* objv, const(char)* file,
                          int line);
    alias da_Tcl_DbNewLongObj =
        Tcl_Obj* function(long longValue, const(char)* file, int line);
    alias da_Tcl_DbNewObj = Tcl_Obj* function(const char* file, int line);
    alias da_Tcl_DbNewStringObj =
        Tcl_Obj* function(const(char)* bytes, int length, const(char)* file,
                          int line);
    alias da_Tcl_DuplicateObj = Tcl_Obj* function(Tcl_Obj* objPtr);
    alias da_TclFreeObj = void function(Tcl_Obj* objPtr);
    alias da_Tcl_GetBoolean =
        int function(Tcl_Interp* interp, const(char)* src, int* boolPtr);
    alias da_Tcl_GetBooleanFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int* boolPtr);
    alias da_Tcl_GetByteArrayFromObj =
        ubyte* function(Tcl_Obj* objPtr, int* lengthPtr);
    alias da_Tcl_GetDouble =
        int function(Tcl_Interp* interp, const(char)* src, double* doublePtr);
    alias da_Tcl_GetDoubleFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, double* doublePtr);
    alias da_Tcl_GetIndexFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     const(const(char)*)* tablePtr, const(char)* msg,
                     int flags, int* indexPtr);
    alias da_Tcl_GetInt =
        int function(Tcl_Interp* interp, const(char)* src, int* intPtr);
    alias da_Tcl_GetIntFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int* intPtr);
    alias da_Tcl_GetLongFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, long* longPtr);
    alias da_Tcl_GetObjType =
        const(Tcl_ObjType)* function(const(char)* typeName);
    alias da_Tcl_GetStringFromObj =
        char* function(Tcl_Obj* objPtr, int* lengthPtr);
    alias da_Tcl_InvalidateStringRep = void function(Tcl_Obj* objPtr);
    alias da_Tcl_ListObjAppendList =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr,
                     Tcl_Obj* elemListPtr);
    alias da_Tcl_ListObjAppendElement =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr, Tcl_Obj* objPtr);
    alias da_Tcl_ListObjGetElements =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr, int* objcPtr,
                     Tcl_Obj*** objvPtr);
    alias da_Tcl_ListObjIndex =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr, int index,
                     Tcl_Obj** objPtrPtr);
    alias da_Tcl_ListObjLength =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr, int* lengthPtr);
    alias da_Tcl_ListObjReplace =
        int function(Tcl_Interp* interp, Tcl_Obj* listPtr, int first, int count,
                     int objc, const(Tcl_Obj*)* objv);
    alias da_Tcl_NewBooleanObj = Tcl_Obj* function(int boolValue);
    alias da_Tcl_NewByteArrayObj =
        Tcl_Obj* function(const(ubyte)* bytes, int length);
    alias da_Tcl_NewDoubleObj = Tcl_Obj* function(double doubleValue);
    alias da_Tcl_NewIntObj = Tcl_Obj* function(int intValue);
    alias da_Tcl_NewListObj =
        Tcl_Obj* function(int objc, const(Tcl_Obj*)* objv);
    alias da_Tcl_NewLongObj = Tcl_Obj* function(long longValue);
    alias da_Tcl_NewObj = Tcl_Obj* function();
    alias da_Tcl_NewStringObj =
        Tcl_Obj*  function(const(char)* bytes, int length);
    alias da_Tcl_SetBooleanObj =
        void function(Tcl_Obj* objPtr, int boolValue);
    alias da_Tcl_SetByteArrayLength =
        ubyte* function(Tcl_Obj* objPtr, int length);
    alias da_Tcl_SetByteArrayObj =
        void function(Tcl_Obj* objPtr, const(ubyte)* bytes, int length);
    alias da_Tcl_SetDoubleObj =
        void function(Tcl_Obj* objPtr, double doubleValue);
    alias da_Tcl_SetIntObj = void function(Tcl_Obj* objPtr, int intValue);
    alias da_Tcl_SetListObj =
        void function(Tcl_Obj* objPtr, int objc, const(Tcl_Obj*)* objv);
    alias da_Tcl_SetLongObj = void function(Tcl_Obj* objPtr, long longValue);
    alias da_Tcl_SetObjLength = void function(Tcl_Obj* objPtr, int length);
    alias da_Tcl_SetStringObj =
        void function(Tcl_Obj* objPtr, const(char)* bytes, int length);
    alias da_Tcl_AddErrorInfo =
        void function(Tcl_Interp* interp, const(char)* message);
    alias da_Tcl_AddObjErrorInfo =
        void function(Tcl_Interp* interp, const(char)* message, int length);
    alias da_Tcl_AllowExceptions = void function(Tcl_Interp* interp);
    alias da_Tcl_AppendElement =
        void function(Tcl_Interp* interp, const(char)* element);
    alias da_Tcl_AppendResult = void function(Tcl_Interp* interp, ...);
    alias da_Tcl_AsyncCreate =
        Tcl_AsyncHandler function(Tcl_AsyncProc proc, ClientData clientData);
    alias da_Tcl_AsyncDelete = void function(Tcl_AsyncHandler async);
    alias da_Tcl_AsyncInvoke = int function(Tcl_Interp* interp, int code);
    alias da_Tcl_AsyncMark = void function(Tcl_AsyncHandler async);
    alias da_Tcl_AsyncReady = int function();
    alias da_Tcl_BackgroundError = void function(Tcl_Interp* interp);
    alias da_Tcl_Backslash = char function(const(char)* src, int* readPtr);
    alias da_Tcl_BadChannelOption =
        int function(Tcl_Interp* interp, const(char)* optionName,
                     const(char)* optionList);
    alias da_Tcl_CallWhenDeleted =
        void function(Tcl_Interp* interp, Tcl_InterpDeleteProc proc,
                      ClientData clientData);
    alias da_Tcl_CancelIdleCall =
        void function(Tcl_IdleProc idleProc, ClientData clientData);
    alias da_Tcl_Close = int function(Tcl_Interp* interp, Tcl_Channel chan);
    alias da_Tcl_CommandComplete = int function(const(char)* cmd);
    alias da_Tcl_Concat =
        char* function(int argc, const(const(char)*)* argv);
    alias da_Tcl_ConvertElement =
        int function(const(char)* src, char* dst, int flags);
    alias da_Tcl_ConvertCountedElement =
        int function(const(char)* src, int length, char* dst, int flags);
    alias da_Tcl_CreateAlias =
        int function(Tcl_Interp* slave, const(char)* slaveCmd,
                     Tcl_Interp* target, const(char)* targetCmd, int argc,
                     const(const(char)*)* argv);
    alias da_Tcl_CreateAliasObj =
        int function(Tcl_Interp* slave, const(char)* slaveCmd,
                     Tcl_Interp* target, const(char)* targetCmd, int objc,
                     const(Tcl_Obj*)* objv);
    alias da_Tcl_CreateChannel =
        Tcl_Channel function(const Tcl_ChannelType* typePtr,
                             const(char)* chanName, ClientData instanceData,
                             int mask);
    alias da_Tcl_CreateChannelHandler =
        void function(Tcl_Channel chan, int mask, Tcl_ChannelProc proc,
                      ClientData clientData);
    alias da_Tcl_CreateCloseHandler =
        void function(Tcl_Channel chan, Tcl_CloseProc proc,
                      ClientData clientData);
    alias da_Tcl_CreateCommand =
        Tcl_Command function(Tcl_Interp* interp, const(char)* cmdName,
                             Tcl_CmdProc proc, ClientData clientData,
                             Tcl_CmdDeleteProc deleteProc);
    alias da_Tcl_CreateEventSource =
        void function(Tcl_EventSetupProc setupProc,
                      Tcl_EventCheckProc checkProc, ClientData clientData);
    alias da_Tcl_CreateExitHandler =
        void function(Tcl_ExitProc proc, ClientData clientData);
    alias da_Tcl_CreateInterp = Tcl_Interp* function();
    alias da_Tcl_CreateMathFunc =
        void function(Tcl_Interp* interp, const(char)* name, int numArgs,
                      Tcl_ValueType* argTypes, Tcl_MathProc proc,
                      ClientData clientData);
    alias da_Tcl_CreateObjCommand =
        Tcl_Command function(Tcl_Interp* interp, const(char)* cmdName,
                             Tcl_ObjCmdProc proc, ClientData clientData,
                             Tcl_CmdDeleteProc deleteProc);
    alias da_Tcl_CreateSlave =
        Tcl_Interp* function(Tcl_Interp* interp, const(char)* slaveName,
                             int isSafe);
    alias da_Tcl_CreateTimerHandler =
        Tcl_TimerToken function(int milliseconds, Tcl_TimerProc proc,
                                ClientData clientData);
    alias da_Tcl_CreateTrace =
        Tcl_Trace function(Tcl_Interp* interp, int level,
                           Tcl_CmdTraceProc proc, ClientData clientData);
    alias da_Tcl_DeleteAssocData =
        void function(Tcl_Interp* interp, const(char)* name);
    alias da_Tcl_DeleteChannelHandler =
        void function(Tcl_Channel chan, Tcl_ChannelProc proc,
                      ClientData clientData);
    alias da_Tcl_DeleteCloseHandler =
        void function(Tcl_Channel chan, Tcl_CloseProc proc,
                      ClientData clientData);
    alias da_Tcl_DeleteCommand =
        int function(Tcl_Interp* interp, const(char)* cmdName);
    alias da_Tcl_DeleteCommandFromToken =
        int function(Tcl_Interp* interp, Tcl_Command command);
    alias da_Tcl_DeleteEvents =
        void function(Tcl_EventDeleteProc proc, ClientData clientData);
    alias da_Tcl_DeleteEventSource =
        void function(Tcl_EventSetupProc setupProc,
                      Tcl_EventCheckProc checkProc, ClientData clientData);
    alias da_Tcl_DeleteExitHandler =
        void function(Tcl_ExitProc proc, ClientData clientData);
    alias da_Tcl_DeleteHashEntry = void function(Tcl_HashEntry* entryPtr);
    alias da_Tcl_DeleteHashTable = void function(Tcl_HashTable* tablePtr);
    alias da_Tcl_DeleteInterp = void function(Tcl_Interp* interp);
    alias da_Tcl_DetachPids = void function(int numPids, Tcl_Pid* pidPtr);
    alias da_Tcl_DeleteTimerHandler = void function(Tcl_TimerToken token);
    alias da_Tcl_DeleteTrace =
        void function(Tcl_Interp* interp, Tcl_Trace trace);
    alias da_Tcl_DontCallWhenDeleted =
        void function(Tcl_Interp* interp, Tcl_InterpDeleteProc proc,
                      ClientData clientData);
    alias da_Tcl_DoOneEvent = int function(int flags);
    alias da_Tcl_DoWhenIdle =
        void function(Tcl_IdleProc proc, ClientData clientData);
    alias da_Tcl_DStringAppend =
        char*  function(Tcl_DString* dsPtr, const(char)* bytes, int length);
    alias da_Tcl_DStringAppendElement =
        char* function(Tcl_DString* dsPtr, const(char)* element);
    alias da_Tcl_DStringEndSublist = void function(Tcl_DString* dsPtr);
    alias da_Tcl_DStringFree = void function(Tcl_DString* dsPtr);
    alias da_Tcl_DStringGetResult =
        void function(Tcl_Interp* interp, Tcl_DString* dsPtr);
    alias da_Tcl_DStringInit = void function(Tcl_DString* dsPtr);
    alias da_Tcl_DStringResult =
        void function(Tcl_Interp* interp, Tcl_DString* dsPtr);
    alias da_Tcl_DStringSetLength =
        void function(Tcl_DString* dsPtr, int length);
    alias da_Tcl_DStringStartSublist = void function(Tcl_DString* dsPtr);
    alias da_Tcl_Eof = int function(Tcl_Channel chan);
    alias da_Tcl_ErrnoId = const(char)* function();
    alias da_Tcl_ErrnoMsg = const(char)* function(int err);
    alias da_Tcl_Eval = int function(Tcl_Interp* interp, const(char)* script);
    alias da_Tcl_EvalFile =
        int function(Tcl_Interp* interp, const(char)* fileName);
    alias da_Tcl_EvalObj = int function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tcl_EventuallyFree =
        void function(ClientData clientData, Tcl_FreeProc freeProc);
    alias da_Tcl_Exit = void function(int status);
    alias da_Tcl_ExposeCommand =
        int function(Tcl_Interp* interp, const(char)* hiddenCmdToken,
                     const(char)* cmdName);
    alias da_Tcl_ExprBoolean =
        int function(Tcl_Interp* interp, const(char)* expr, int* ptr);
    alias da_Tcl_ExprBooleanObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int* ptr);
    alias da_Tcl_ExprDouble =
        int function(Tcl_Interp* interp, const(char)* expr, double* ptr);
    alias da_Tcl_ExprDoubleObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, double* ptr);
    alias da_Tcl_ExprLong =
        int function(Tcl_Interp* interp, const(char)* expr, long* ptr);
    alias da_Tcl_ExprLongObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, long* ptr);
    alias da_Tcl_ExprObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     Tcl_Obj** resultPtrPtr);
    alias da_Tcl_ExprString =
        int function(Tcl_Interp* interp, const(char)* expr);
    alias da_Tcl_Finalize = void function();
    alias da_Tcl_FindExecutable = void function(const(char)* argv0);
    alias da_Tcl_FirstHashEntry =
        Tcl_HashEntry* function(Tcl_HashTable* tablePtr,
                                Tcl_HashSearch* searchPtr);
    alias da_Tcl_Flush = int function(Tcl_Channel chan);
    alias da_Tcl_FreeResult = void function(Tcl_Interp* interp);
    alias da_Tcl_GetAlias =
        int function(Tcl_Interp* interp, const(char)* slaveCmd,
                     Tcl_Interp** targetInterpPtr, const(char)** targetCmdPtr,
                     int* argcPtr, const(char)*** argvPtr);
    alias da_Tcl_GetAliasObj =
        int function(Tcl_Interp* interp, const(char)* slaveCmd,
                     Tcl_Interp** targetInterpPtr, const(char)** targetCmdPtr,
                     int* objcPtr, Tcl_Obj*** objv);
    alias da_Tcl_GetAssocData =
        ClientData function(Tcl_Interp* interp, const(char)* name,
                            Tcl_InterpDeleteProc* procPtr);
    alias da_Tcl_GetChannel =
        Tcl_Channel function(Tcl_Interp* interp, const(char)* chanName,
                             int* modePtr);
    alias da_Tcl_GetChannelBufferSize = int function(Tcl_Channel chan);
    alias da_Tcl_GetChannelHandle =
        int function(Tcl_Channel chan, int direction, ClientData* handlePtr);
    alias da_Tcl_GetChannelInstanceData = ClientData function(Tcl_Channel chan);
    alias da_Tcl_GetChannelMode = int function(Tcl_Channel chan);
    alias da_Tcl_GetChannelName = const(char)* function(Tcl_Channel chan);
    alias da_Tcl_GetChannelOption =
        int function(Tcl_Interp* interp, Tcl_Channel chan,
                     const(char)* optionName, Tcl_DString* dsPtr);
    alias da_Tcl_GetChannelType =
        const(Tcl_ChannelType)* function(Tcl_Channel chan);
    alias da_Tcl_GetCommandInfo =
        int function(Tcl_Interp* interp, const(char)* cmdName,
                     Tcl_CmdInfo* infoPtr);
    alias da_Tcl_GetCommandName =
        const(char)* function(Tcl_Interp* interp, Tcl_Command command);
    alias da_Tcl_GetErrno = int function();
    alias da_Tcl_GetHostName = const(char)* function();
    alias da_Tcl_GetInterpPath =
        int function(Tcl_Interp* askInterp, Tcl_Interp* slaveInterp);
    alias da_Tcl_GetMaster = Tcl_Interp*  function(Tcl_Interp* interp);
    alias da_Tcl_GetNameOfExecutable = const(char)* function();
    alias da_Tcl_GetObjResult = Tcl_Obj* function(Tcl_Interp* interp);

    version      (linux)
    {
        alias da_Tcl_GetOpenFile =
            int function(Tcl_Interp* interp, const(char)* chanID,
                         int forWriting, int checkUsage, ClientData* filePtr);
    }
    else version (mac)
    {
        alias da_Tcl_GetOpenFile =
            int function(Tcl_Interp* interp, const(char)* chanID,
                         int forWriting, int checkUsage, ClientData* filePtr);
    }

    alias da_Tcl_GetPathType = Tcl_PathType function(const(char)* path);
    alias da_Tcl_Gets = int function(Tcl_Channel chan, Tcl_DString* dsPtr);
    alias da_Tcl_GetsObj = int function(Tcl_Channel chan, Tcl_Obj* objPtr);
    alias da_Tcl_GetServiceMode = int function();
    alias da_Tcl_GetSlave =
        Tcl_Interp* function(Tcl_Interp* interp, const(char)* slaveName);
    alias da_Tcl_GetStdChannel = Tcl_Channel function(int type);
    alias da_Tcl_GetStringResult =  const(char)* function(Tcl_Interp* interp);
    alias da_Tcl_GetVar =
        const(char)* function (Tcl_Interp* interp, const(char)* varName,
                               int flags);
    alias da_Tcl_GetVar2 =
        const(char)* function(Tcl_Interp* interp, const(char)* part1,
                              const(char)* part2, int flags);
    alias da_Tcl_GlobalEval =
        int function(Tcl_Interp* interp, const(char)* command);
    alias da_Tcl_GlobalEvalObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tcl_HideCommand =
        int function(Tcl_Interp* interp, const(char)* cmdName,
                     const(char)* hiddenCmdToken);
    alias da_Tcl_Init = int function(Tcl_Interp* interp);
    alias da_Tcl_InitHashTable =
        void function(Tcl_HashTable* tablePtr, int keyType);
    alias da_Tcl_InputBlocked = int function(Tcl_Channel chan);
    alias da_Tcl_InputBuffered = int function(Tcl_Channel chan);
    alias da_Tcl_InterpDeleted = int function(Tcl_Interp* interp);
    alias da_Tcl_IsSafe = int function(Tcl_Interp* interp);
    alias da_Tcl_JoinPath =
        char* function(int argc, const(const(char)*)* argv,
                       Tcl_DString* resultPtr);
    alias da_Tcl_LinkVar =
        int function(Tcl_Interp* interp, const(char)* varName, char* addr,
                     int type);
    alias da_Tcl_MakeFileChannel =
        Tcl_Channel function(ClientData handle, int mode);
    alias da_Tcl_MakeSafe = int function(Tcl_Interp* interp);
    alias da_Tcl_MakeTcpClientChannel =
        Tcl_Channel function(ClientData tcpSocket);
    alias da_Tcl_Merge = char* function(int argc, const(const(char)*)* argv);
    alias da_Tcl_NextHashEntry =
        Tcl_HashEntry* function(Tcl_HashSearch* searchPtr);
    alias da_Tcl_NotifyChannel = void function(Tcl_Channel channel, int mask);
    alias da_Tcl_ObjGetVar2 =
        Tcl_Obj* function(Tcl_Interp* interp, Tcl_Obj* part1Ptr,
                          Tcl_Obj* part2Ptr, int flags);
    alias da_Tcl_ObjSetVar2 =
        Tcl_Obj* function(Tcl_Interp* interp, Tcl_Obj* part1Ptr,
                          Tcl_Obj* part2Ptr, Tcl_Obj* newValuePtr, int flags);
    alias da_Tcl_OpenCommandChannel =
        Tcl_Channel function(Tcl_Interp* interp, int argc,
                             const(const(char)*)* argv, int flags);
    alias da_Tcl_OpenFileChannel =
        Tcl_Channel function(Tcl_Interp* interp, const(char)* fileName,
                             const(char)* modeString, int permissions);
    alias da_Tcl_OpenTcpClient =
        Tcl_Channel function(Tcl_Interp* interp, int port, const(char)* address,
                             const(char)* myaddr, int myport, int async);
    alias da_Tcl_OpenTcpServer =
        Tcl_Channel function(Tcl_Interp* interp, int port, const(char)* host,
                             Tcl_TcpAcceptProc acceptProc,
                             ClientData callbackData);
    alias da_Tcl_Preserve = void function(ClientData data);
    alias da_Tcl_PrintDouble =
        void function(Tcl_Interp* interp, double value, char* dst);
    alias da_Tcl_PutEnv = int function(const(char)* assignment);
    alias da_Tcl_PosixError = const(char)* function(Tcl_Interp* interp);
    alias da_Tcl_QueueEvent =
        void function(Tcl_Event* evPtr, Tcl_QueuePosition position);
    alias da_Tcl_Read =
        int function(Tcl_Channel chan, char* bufPtr, int toRead);
    alias da_Tcl_ReapDetachedProcs = void function();
    alias da_Tcl_RecordAndEval =
        int function(Tcl_Interp* interp, const(char)* cmd, int flags);
    alias da_Tcl_RecordAndEvalObj =
        int function(Tcl_Interp* interp, Tcl_Obj* cmdPtr, int flags);
    alias da_Tcl_RegisterChannel =
        void function(Tcl_Interp* interp, Tcl_Channel chan);
    alias da_Tcl_RegisterObjType = void function(const Tcl_ObjType* typePtr);
    alias da_Tcl_RegExpCompile =
        Tcl_RegExp function(Tcl_Interp* interp, const(char)* pattern);
    alias da_Tcl_RegExpExec =
        int function(Tcl_Interp* interp, Tcl_RegExp regexp, const(char)* text,
                     const(char)* start);
    alias da_Tcl_RegExpMatch =
        int function(Tcl_Interp* interp, const(char)* text,
                     const(char)* pattern);
    alias da_Tcl_RegExpRange =
        void function(Tcl_RegExp regexp, int index, const(char)** startPtr,
                      const(char)** endPtr);
    alias da_Tcl_Release = void function(ClientData clientData);
    alias da_Tcl_ResetResult = void function(Tcl_Interp* interp);
    alias da_Tcl_ScanElement = int function(const(char)* src, int* flagPtr);
    alias da_Tcl_ScanCountedElement =
        int function(const(char)* src, int length, int* flagPtr);
    alias da_Tcl_SeekOld = int function(Tcl_Channel chan, int offset, int mode);
    alias da_Tcl_ServiceAll = int function();
    alias da_Tcl_ServiceEvent = int function(int flags);
    alias da_Tcl_SetAssocData =
        void function(Tcl_Interp* interp, const(char)* name,
                      Tcl_InterpDeleteProc proc, ClientData clientData);
    alias da_Tcl_SetChannelBufferSize = void function(Tcl_Channel chan, int sz);
    alias da_Tcl_SetChannelOption =
        int function(Tcl_Interp* interp, Tcl_Channel chan,
                     const(char)* optionName, const(char)* newValue);
    alias da_Tcl_SetCommandInfo =
        int function(Tcl_Interp* interp, const(char)* cmdName,
                     const(Tcl_CmdInfo)* infoPtr);
    alias da_Tcl_SetErrno = void function(int err);
    alias da_Tcl_SetErrorCode = void function(Tcl_Interp* interp, ...);
    alias da_Tcl_SetMaxBlockTime = void function(const Tcl_Time* timePtr);
    alias da_Tcl_SetPanicProc = void function(Tcl_PanicProc panicProc);
    alias da_Tcl_SetRecursionLimit =
        int function(Tcl_Interp* interp, int depth);
    alias da_Tcl_SetResult =
        void function(Tcl_Interp* interp, char* result, Tcl_FreeProc freeProc);
    alias da_Tcl_SetServiceMode = int function(int mode);
    alias da_Tcl_SetObjErrorCode =
        void function(Tcl_Interp* interp, Tcl_Obj* errorObjPtr);
    alias da_Tcl_SetObjResult =
        void function(Tcl_Interp* interp, Tcl_Obj* resultObjPtr);
    alias da_Tcl_SetStdChannel = void function(Tcl_Channel channel, int type);
    alias da_Tcl_SetVar =
        const(char)* function(Tcl_Interp* interp, const(char)* varName,
                              const(char)* newValue, int flags);
    alias da_Tcl_SetVar2 =
        const(char)* function(Tcl_Interp* interp, const(char)* part1,
                              const(char)* part2, const(char)* newValue,
                              int flags);
    alias da_Tcl_SignalId = const(char)* function(int sig);
    alias da_Tcl_SignalMsg = const(char)* function(int sig);
    alias da_Tcl_SourceRCFile = void function(Tcl_Interp* interp);
    alias da_Tcl_SplitList =
        int function(Tcl_Interp* interp, const(char)* listStr, int* argcPtr,
                     const(char)*** argvPtr);
    alias da_Tcl_SplitPath =
        void function(const(char)* path, int* argcPtr, const(char)*** argvPtr);
    alias da_Tcl_StaticPackage =
        void function(Tcl_Interp* interp, const(char)* pkgName,
                      Tcl_PackageInitProc initProc,
                      Tcl_PackageInitProc safeInitProc);
    alias da_Tcl_StringMatch =
        int function(const(char)* str, const(char)* pattern);
    alias da_Tcl_TellOld = int function(Tcl_Channel chan);
    alias da_Tcl_TraceVar =
        int function(Tcl_Interp* interp, const(char)* varName, int flags,
                     Tcl_VarTraceProc proc, ClientData clientData);
    alias da_Tcl_TraceVar2 =
        int function(Tcl_Interp* interp, const(char)* part1, const(char)* part2,
                     int flags, Tcl_VarTraceProc proc, ClientData clientData);
    alias da_Tcl_TranslateFileName =
        char* function(Tcl_Interp* interp, const(char)* name,
                       Tcl_DString* bufferPtr);
    alias da_Tcl_Ungets =
        int function(Tcl_Channel chan, const(char)* str, int len, int atHead);
    alias da_Tcl_UnlinkVar =
        void function(Tcl_Interp* interp, const(char)* varName);
    alias da_Tcl_UnregisterChannel =
        int function(Tcl_Interp* interp, Tcl_Channel chan);
    alias da_Tcl_UnsetVar =
        int function(Tcl_Interp* interp, const(char)* varName, int flags);
    alias da_Tcl_UnsetVar2 =
        int function(Tcl_Interp* interp, const(char)* part1, const(char)* part2,
                     int flags);
    alias da_Tcl_UntraceVar =
        void function(Tcl_Interp* interp, const(char)* varName, int flags,
                      Tcl_VarTraceProc proc, ClientData clientData);
    alias da_Tcl_UntraceVar2 =
        void function(Tcl_Interp* interp, const(char)* part1,
                      const(char)* part2, int flags, Tcl_VarTraceProc proc,
                      ClientData clientData);
    alias da_Tcl_UpdateLinkedVar =
        void function(Tcl_Interp* interp, const(char)* varName);
    alias da_Tcl_UpVar =
        int function(Tcl_Interp* interp, const(char)* frameName,
                     const(char)* varName, const(char)* localName, int flags);
    alias da_Tcl_UpVar2 =
        int function(Tcl_Interp* interp, const(char)* frameName,
                     const(char)* part1, const(char)* part2,
                     const(char)* localName, int flags);
    alias da_Tcl_VarEval = int function(Tcl_Interp* interp, ...);
    alias da_Tcl_VarTraceInfo =
        ClientData function(Tcl_Interp* interp, const(char)* varName, int flags,
                            Tcl_VarTraceProc procPtr,
                            ClientData prevClientData);
    alias da_Tcl_VarTraceInfo2 =
        ClientData function(Tcl_Interp* interp, const(char)* part1,
                            const(char)* part2, int flags,
                            Tcl_VarTraceProc procPtr,
                            ClientData prevClientData);
    alias da_Tcl_Write =
        int function(Tcl_Channel chan, const(char)* s, int slen);
    alias da_Tcl_WrongNumArgs =
        void function(Tcl_Interp* interp, int objc, const(Tcl_Obj*)* objv,
                      const(char)* message);
    alias da_Tcl_DumpActiveMemory = int function(const(char)* fileName);
    alias da_Tcl_ValidateAllMemory = void function(const(char)* file, int line);
    alias da_Tcl_AppendResultVA =
        void function(Tcl_Interp* interp, va_list argList);
    alias da_Tcl_AppendStringsToObjVA =
        void function(Tcl_Obj* objPtr, va_list argList);
    alias da_Tcl_HashStats = char*  function(Tcl_HashTable* tablePtr);
    alias da_Tcl_ParseVar =
        const(char)* function(Tcl_Interp* interp, const(char)* start,
                              const(char)** termPtr);
    alias da_Tcl_PkgPresent =
        const(char)* function(Tcl_Interp* interp, const(char)* name,
                              const(char)* ver, int exact);
    alias da_Tcl_PkgPresentEx =
        const(char)* function(Tcl_Interp* interp, const(char)* name,
                              const(char)* ver, int exact,
                              void* clientDataPtr);
    alias da_Tcl_PkgProvide =
        int function(Tcl_Interp* interp, const(char)* name,
                     const(char)* ver);
    alias da_Tcl_PkgRequire =
        const(char)* function(Tcl_Interp* interp, const(char)* name,
                              const(char)* ver, int exact);
    alias da_Tcl_SetErrorCodeVA =
        void function(Tcl_Interp* interp, va_list argList);
    alias da_Tcl_VarEvalVA = int function(Tcl_Interp* interp, va_list argList);
    alias da_Tcl_WaitPid =
        Tcl_Pid function(Tcl_Pid pid, int* statPtr, int options);
    alias da_Tcl_PanicVA = void function(const(char)* format, va_list argList);
    alias da_Tcl_GetVersion =
        void function(int* major, int* minor, int* patchLevel, int* type);
    alias da_Tcl_InitMemory = void function(Tcl_Interp* interp);
    alias da_Tcl_StackChannel =
        Tcl_Channel function(Tcl_Interp* interp, const Tcl_ChannelType* typePtr,
                             ClientData instanceData, int mask,
                             Tcl_Channel prevChan);
    alias da_Tcl_UnstackChannel =
        int function(Tcl_Interp* interp, Tcl_Channel chan);
    alias da_Tcl_GetStackedChannel = Tcl_Channel function(Tcl_Channel chan);
    alias da_Tcl_SetMainLoop = void function(Tcl_MainLoopProc proc);
    alias da_Tcl_AppendObjToObj =
        void function(Tcl_Obj* objPtr, Tcl_Obj* appendObjPtr);
    alias da_Tcl_CreateEncoding =
        Tcl_Encoding function(const Tcl_EncodingType* typePtr);
    alias da_Tcl_CreateThreadExitHandler =
        void function(Tcl_ExitProc proc, ClientData clientData);
    alias da_Tcl_DeleteThreadExitHandler =
        void function(Tcl_ExitProc proc, ClientData clientData);
    alias da_Tcl_DiscardResult = void function(Tcl_SavedResult* statePtr);
    alias da_Tcl_EvalEx =
        int function(Tcl_Interp* interp, const(char)* script, int numBytes,
                     int flags);
    alias da_Tcl_EvalObjv =
        int function(Tcl_Interp* interp, int objc, const(Tcl_Obj*)* objv,
                     int flags);
    alias da_Tcl_EvalObjEx =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int flags);
    alias da_Tcl_ExitThread = void function(int status);
    alias da_Tcl_ExternalToUtf =
        int function(Tcl_Interp* interp, Tcl_Encoding encoding,
                     const(char)* src, int srcLen, int flags,
                     Tcl_EncodingState* statePtr, char* dst, int dstLen,
                     int* srcReadPtr, int* dstWrotePtr, int* dstCharsPtr);
    alias da_Tcl_ExternalToUtfDString =
        char* function(Tcl_Encoding encoding, const(char)* src, int srcLen,
                       Tcl_DString* dsPtr);
    alias da_Tcl_FinalizeThread = void function();
    alias da_Tcl_FinalizeNotifier = void function(ClientData clientData);
    alias da_Tcl_FreeEncoding = void function(Tcl_Encoding encoding);
    alias da_Tcl_GetCurrentThread = Tcl_ThreadId function();
    alias da_Tcl_GetEncoding =
        Tcl_Encoding function(Tcl_Interp* interp, const(char)* name);
    alias da_Tcl_GetEncodingName = const(char)* function(Tcl_Encoding encoding);
    alias da_Tcl_GetEncodingNames = void function(Tcl_Interp* interp);
    alias da_Tcl_GetIndexFromObjStruct =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, const void* tablePtr,
                     int offset, const(char)* msg, int flags, int* indexPtr);
    alias da_Tcl_GetThreadData =
        void*  function(Tcl_ThreadDataKey* keyPtr, int size);
    alias da_Tcl_GetVar2Ex =
        Tcl_Obj*  function(Tcl_Interp* interp, const(char)* part1,
                           const(char)* part2, int flags);
    alias da_Tcl_InitNotifier = ClientData function();
    alias da_Tcl_MutexLock = void function(Tcl_Mutex* mutexPtr);
    alias da_Tcl_MutexUnlock = void function(Tcl_Mutex* mutexPtr);
    alias da_Tcl_ConditionNotify = void function(Tcl_Condition* condPtr);
    alias da_Tcl_ConditionWait =
        void function(Tcl_Condition* condPtr, Tcl_Mutex* mutexPtr,
                      const(Tcl_Time)* timePtr);
    alias da_Tcl_NumUtfChars = int function(const(char)* src, int length);
    alias da_Tcl_ReadChars =
        int function(Tcl_Channel channel, Tcl_Obj* objPtr, int charsToRead,
                     int appendFlag);
    alias da_Tcl_RestoreResult =
        void function(Tcl_Interp* interp, Tcl_SavedResult* statePtr);
    alias da_Tcl_SaveResult =
        void function(Tcl_Interp* interp, Tcl_SavedResult* statePtr);
    alias da_Tcl_SetSystemEncoding =
        int function(Tcl_Interp* interp, const(char)* name);
    alias da_Tcl_SetVar2Ex =
        Tcl_Obj* function(Tcl_Interp* interp, const(char)* part1,
                          const(char)* part2, Tcl_Obj* newValuePtr, int flags);
    alias da_Tcl_ThreadAlert = void function(Tcl_ThreadId threadId);
    alias da_Tcl_ThreadQueueEvent =
        void function(Tcl_ThreadId threadId, Tcl_Event* evPtr,
                      Tcl_QueuePosition position);
    alias da_Tcl_UniCharAtIndex =
        Tcl_UniChar function(const(char)* src, int index);
    alias da_Tcl_UniCharToLower = Tcl_UniChar function(int ch);
    alias da_Tcl_UniCharToTitle = Tcl_UniChar function(int ch);
    alias da_Tcl_UniCharToUpper = Tcl_UniChar function(int ch);
    alias da_Tcl_UniCharToUtf = int function(int ch, char* buf);
    alias da_Tcl_UtfAtIndex =
        const(char)* function(const(char)* src, int index);
    alias da_Tcl_UtfCharComplete = int function(const(char)* src, int length);
    alias da_Tcl_UtfBackslash =
        int function(const(char)* src, int* readPtr, char* dst);
    alias da_Tcl_UtfFindFirst =
        const(char)* function(const(char)* src, int ch);
    alias da_Tcl_UtfFindLast = const(char)* function(const(char)* src, int ch);
    alias da_Tcl_UtfNext = const(char)* function(const(char)* src);
    alias da_Tcl_UtfPrev =
        const(char)* function(const(char)* src, const(char)* start);
    alias da_Tcl_UtfToExternal =
        int function(Tcl_Interp* interp, Tcl_Encoding encoding,
                     const(char)* src, int srcLen, int flags,
                     Tcl_EncodingState* statePtr, char* dst, int dstLen,
                     int* srcReadPtr, int* dstWrotePtr, int* dstCharsPtr);
    alias da_Tcl_UtfToExternalDString =
        char* function(Tcl_Encoding encoding, const(char)* src, int srcLen,
                       Tcl_DString* dsPtr);
    alias da_Tcl_UtfToLower = int function(char* src);
    alias da_Tcl_UtfToTitle = int function(char* src);
    alias da_Tcl_UtfToUniChar =
        int function(const(char)* src, Tcl_UniChar* chPtr);
    alias da_Tcl_UtfToUpper = int function(char* src);
    alias da_Tcl_WriteChars =
        int function(Tcl_Channel chan, const(char)* src, int srcLen);
    alias da_Tcl_WriteObj = int function(Tcl_Channel chan, Tcl_Obj* objPtr);
    alias da_Tcl_GetString = char*  function(Tcl_Obj* objPtr);
    alias da_Tcl_GetDefaultEncodingDir = const(char)* function();
    alias da_Tcl_SetDefaultEncodingDir = void function(const(char)* path);
    alias da_Tcl_AlertNotifier = void function(ClientData clientData);
    alias da_Tcl_ServiceModeHook = void function(int mode);
    alias da_Tcl_UniCharIsAlnum = int function(int ch);
    alias da_Tcl_UniCharIsAlpha = int function(int ch);
    alias da_Tcl_UniCharIsDigit = int function(int ch);
    alias da_Tcl_UniCharIsLower = int function(int ch);
    alias da_Tcl_UniCharIsSpace = int function(int ch);
    alias da_Tcl_UniCharIsUpper = int function(int ch);
    alias da_Tcl_UniCharIsWordChar = int function(int ch);
    alias da_Tcl_UniCharLen = int function(const Tcl_UniChar* uniStr);
    alias da_Tcl_UniCharNcmp =
        int function(const Tcl_UniChar* ucs, const(Tcl_UniChar)* uct,
                     uint numChars);
    alias da_Tcl_UniCharToUtfDString =
        char* function(const(Tcl_UniChar)* uniStr, int uniLength,
                       Tcl_DString* dsPtr);
    alias da_Tcl_UtfToUniCharDString =
        Tcl_UniChar* function(const(char)* src, int length, Tcl_DString* dsPtr);
    alias da_Tcl_GetRegExpFromObj =
        Tcl_RegExp function(Tcl_Interp* interp, Tcl_Obj* patObj, int flags);
    alias da_Tcl_EvalTokens =
        Tcl_Obj* function(Tcl_Interp* interp, Tcl_Token* tokenPtr, int count);
    alias da_Tcl_FreeParse = void function(Tcl_Parse* parsePtr);
    alias da_Tcl_LogCommandInfo =
        void function(Tcl_Interp* interp, const(char)* script,
                      const(char)* command, int length);
    alias da_Tcl_ParseBraces =
        int function(Tcl_Interp* interp, const(char)* start, int numBytes,
                     Tcl_Parse* parsePtr, int append, const(char)** termPtr);
    alias da_Tcl_ParseCommand =
        int function(Tcl_Interp* interp, const(char)* start, int numBytes,
                     int nested, Tcl_Parse* parsePtr);
    alias da_Tcl_ParseExpr =
        int function(Tcl_Interp* interp, const(char)* start, int numBytes,
                     Tcl_Parse* parsePtr);
    alias da_Tcl_ParseQuotedString =
        int function(Tcl_Interp* interp, const(char)* start, int numBytes,
                     Tcl_Parse* parsePtr, int append, const(char)** termPtr);
    alias da_Tcl_ParseVarName =
        int function(Tcl_Interp* interp, const(char)* start, int numBytes,
                     Tcl_Parse* parsePtr, int append);
    alias da_Tcl_GetCwd =
        char*  function(Tcl_Interp* interp, Tcl_DString* cwdPtr);
    alias da_Tcl_Chdir = int function(const(char)* dirName);
    alias da_Tcl_Access = int function(const(char)* path, int mode);
    alias da_Tcl_Stat = int function(const(char)* path, stat* bufPtr);
    alias da_Tcl_UtfNcmp =
        int function(const(char)* s1, const(char)* s2, uint n);
    alias da_Tcl_UtfNcasecmp =
        int function(const(char)* s1, const(char)* s2, uint n);
    alias da_Tcl_StringCaseMatch =
        int function(const(char)* str, const(char)* pattern, int nocase);
    alias da_Tcl_UniCharIsControl = int function(int ch);
    alias da_Tcl_UniCharIsGraph = int function(int ch);
    alias da_Tcl_UniCharIsPrint = int function(int ch);
    alias da_Tcl_UniCharIsPunct = int function(int ch);
    alias da_Tcl_RegExpExecObj =
        int function(Tcl_Interp* interp, Tcl_RegExp regexp, Tcl_Obj* textObj,
                     int offset, int nmatches, int flags);
    alias da_Tcl_RegExpGetInfo =
        void function(Tcl_RegExp regexp, Tcl_RegExpInfo* infoPtr);
    alias da_Tcl_NewUnicodeObj =
        Tcl_Obj*  function(const Tcl_UniChar* unicode, int numChars);
    alias da_Tcl_SetUnicodeObj =
        void function(Tcl_Obj* objPtr, const(Tcl_UniChar)* unicode,
                      int numChars);
    alias da_Tcl_GetCharLength = int function(Tcl_Obj* objPtr);
    alias da_Tcl_GetUniChar = Tcl_UniChar function(Tcl_Obj* objPtr, int index);
    alias da_Tcl_GetUnicode = Tcl_UniChar*  function(Tcl_Obj* objPtr);
    alias da_Tcl_GetRange =
        Tcl_Obj*  function(Tcl_Obj* objPtr, int first, int last);
    alias da_Tcl_AppendUnicodeToObj =
        void function(Tcl_Obj* objPtr, const(Tcl_UniChar)* unicode, int length);
    alias da_Tcl_RegExpMatchObj =
        int function(Tcl_Interp* interp, Tcl_Obj* textObj, Tcl_Obj* patternObj);
    alias da_Tcl_SetNotifier =
        void function(Tcl_NotifierProcs* notifierProcPtr);
    alias da_Tcl_GetAllocMutex = Tcl_Mutex*  function();
    alias da_Tcl_GetChannelNames = int function(Tcl_Interp* interp);
    alias da_Tcl_GetChannelNamesEx =
        int function(Tcl_Interp* interp, const(char)* pattern);
    alias da_Tcl_ProcObjCmd =
        int function(ClientData clientData, Tcl_Interp* interp, int objc,
                     const(Tcl_Obj*)* objv);
    alias da_Tcl_ConditionFinalize = void function(Tcl_Condition* condPtr);
    alias da_Tcl_MutexFinalize = void function(Tcl_Mutex* mutex);
    alias da_Tcl_CreateThread =
        int function(Tcl_ThreadId* idPtr, Tcl_ThreadCreateProc proc,
                     ClientData clientData, int stackSize, int flags);
    alias da_Tcl_ReadRaw =
        int function(Tcl_Channel chan, char* dst, int bytesToRead);
    alias da_Tcl_WriteRaw =
        int function(Tcl_Channel chan, const(char)* src, int srcLen);
    alias da_Tcl_GetTopChannel = Tcl_Channel function(Tcl_Channel chan);
    alias da_Tcl_ChannelBuffered = int function(Tcl_Channel chan);
    alias da_Tcl_ChannelName =
        const(char)* function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelVersion =
        Tcl_ChannelTypeVersion function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelBlockModeProc =
        Tcl_DriverBlockModeProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelCloseProc =
        Tcl_DriverCloseProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelClose2Proc =
        Tcl_DriverClose2Proc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelInputProc =
        Tcl_DriverInputProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelOutputProc =
        Tcl_DriverOutputProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelSeekProc =
        Tcl_DriverSeekProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelSetOptionProc =
        Tcl_DriverSetOptionProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelGetOptionProc =
        Tcl_DriverGetOptionProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelWatchProc =
        Tcl_DriverWatchProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelGetHandleProc =
        Tcl_DriverGetHandleProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelFlushProc =
        Tcl_DriverFlushProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_ChannelHandlerProc =
        Tcl_DriverHandlerProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_JoinThread = int function(Tcl_ThreadId threadId, int* result);
    alias da_Tcl_IsChannelShared = int function(Tcl_Channel channel);
    alias da_Tcl_IsChannelRegistered =
        int function(Tcl_Interp* interp, Tcl_Channel channel);
    alias da_Tcl_CutChannel = void function(Tcl_Channel channel);
    alias da_Tcl_SpliceChannel = void function(Tcl_Channel channel);
    alias da_Tcl_ClearChannelHandlers = void function(Tcl_Channel channel);
    alias da_Tcl_IsChannelExisting = int function(const(char)* channelName);
    alias da_Tcl_UniCharNcasecmp =
        int function(const(Tcl_UniChar)* ucs, const(Tcl_UniChar)* uct,
                     uint numChars);
    alias da_Tcl_UniCharCaseMatch =
        int function(const(Tcl_UniChar)* uniStr, const(Tcl_UniChar)* uniPattern,
                     int nocase);
    alias da_Tcl_FindHashEntry =
        Tcl_HashEntry* function(Tcl_HashTable* tablePtr, const(void)* key);
    alias da_Tcl_CreateHashEntry =
        Tcl_HashEntry* function(Tcl_HashTable* tablePtr, const(void)* key,
                                int* newPtr);
    alias da_Tcl_InitCustomHashTable =
        void function(Tcl_HashTable* tablePtr, int keyType,
                      const(Tcl_HashKeyType)* typePtr);
    alias da_Tcl_InitObjHashTable = void function(Tcl_HashTable* tablePtr);
    alias da_Tcl_CommandTraceInfo =
        ClientData function(Tcl_Interp* interp, const(char)* varName,
                            int flags, Tcl_CommandTraceProc procPtr,
                            ClientData prevClientData);
    alias da_Tcl_TraceCommand =
        int function(Tcl_Interp* interp, const(char)* varName, int flags,
                     Tcl_CommandTraceProc proc, ClientData clientData);
    alias da_Tcl_UntraceCommand =
        void function(Tcl_Interp* interp, const(char)* varName, int flags,
                      Tcl_CommandTraceProc proc, ClientData clientData);
    alias da_Tcl_AttemptAlloc = char*  function(uint size);
    alias da_Tcl_AttemptDbCkalloc =
        char* function(uint size, const(char)* file, int line);
    alias da_Tcl_AttemptRealloc = char* function(char* ptr, uint size);
    alias da_Tcl_AttemptDbCkrealloc =
        char*  function(char* ptr, uint size, const(char)* file, int line);
    alias da_Tcl_AttemptSetObjLength =
        int function(Tcl_Obj* objPtr, int length);
    alias da_Tcl_GetChannelThread = Tcl_ThreadId function(Tcl_Channel channel);
    alias da_Tcl_GetUnicodeFromObj =
        Tcl_UniChar*  function(Tcl_Obj* objPtr, int* lengthPtr);
    alias da_Tcl_GetMathFuncInfo =
        int function(Tcl_Interp* interp, const(char)* name, int* numArgsPtr,
                     Tcl_ValueType** argTypesPtr, Tcl_MathProc* procPtr,
                     ClientData* clientDataPtr);
    alias da_Tcl_ListMathFuncs =
        Tcl_Obj* function(Tcl_Interp* interp, const(char)* pattern);
    alias da_Tcl_SubstObj =
        Tcl_Obj*  function(Tcl_Interp* interp, Tcl_Obj* objPtr, int flags);
    alias da_Tcl_DetachChannel =
        int function(Tcl_Interp* interp, Tcl_Channel channel);
    alias da_Tcl_IsStandardChannel = int function(Tcl_Channel channel);
    alias da_Tcl_FSCopyFile =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr);
    alias da_Tcl_FSCopyDirectory =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr,
                     Tcl_Obj** errorPtr);
    alias da_Tcl_FSCreateDirectory = int function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSDeleteFile = int function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSLoadFile =
        int function(Tcl_Interp* interp, Tcl_Obj* pathPtr, const(char)* sym1,
                     const(char)* sym2, Tcl_PackageInitProc* proc1Ptr,
                     Tcl_PackageInitProc* proc2Ptr, Tcl_LoadHandle* handlePtr,
                     Tcl_FSUnloadFileProc* unloadProcPtr);
    alias da_Tcl_FSMatchInDirectory =
        int function(Tcl_Interp* interp, Tcl_Obj* result, Tcl_Obj* pathPtr,
                     const(char)* pattern, Tcl_GlobTypeData* types);
    alias da_Tcl_FSLink =
        Tcl_Obj*  function(Tcl_Obj* pathPtr, Tcl_Obj* toPtr, int linkAction);
    alias da_Tcl_FSRemoveDirectory =
        int function(Tcl_Obj* pathPtr, int recursive, Tcl_Obj** errorPtr);
    alias da_Tcl_FSRenameFile =
        int function(Tcl_Obj* srcPathPtr, Tcl_Obj* destPathPtr);
    alias da_Tcl_FSLstat = int function(Tcl_Obj* pathPtr, Tcl_StatBuf* buf);
    alias da_Tcl_FSUtime = int function(Tcl_Obj* pathPtr, utimbuf* tval);
    alias da_Tcl_FSFileAttrsGet =
        int function(Tcl_Interp* interp, int index, Tcl_Obj* pathPtr,
                     Tcl_Obj** objPtrRef);
    alias da_Tcl_FSFileAttrsSet =
        int function(Tcl_Interp* interp, int index, Tcl_Obj* pathPtr,
                     Tcl_Obj* objPtr);
    alias da_Tcl_FSFileAttrStrings =
        const(const(char)*)* function(Tcl_Obj* pathPtr, Tcl_Obj** objPtrRef);
    alias da_Tcl_FSStat = int function(Tcl_Obj* pathPtr, Tcl_StatBuf* buf);
    alias da_Tcl_FSAccess = int function(Tcl_Obj* pathPtr, int mode);
    alias da_Tcl_FSOpenFileChannel =
        Tcl_Channel function(Tcl_Interp* interp, Tcl_Obj* pathPtr,
                             const(char)* modeString, int permissions);
    alias da_Tcl_FSGetCwd = Tcl_Obj*  function(Tcl_Interp* interp);
    alias da_Tcl_FSChdir = int function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSConvertToPathType =
        int function(Tcl_Interp* interp, Tcl_Obj* pathPtr);
    alias da_Tcl_FSJoinPath = Tcl_Obj* function(Tcl_Obj* listObj, int elements);
    alias da_Tcl_FSSplitPath = Tcl_Obj* function(Tcl_Obj* pathPtr, int* lenPtr);
    alias da_Tcl_FSEqualPaths =
        int function(Tcl_Obj* firstPtr, Tcl_Obj* secondPtr);
    alias da_Tcl_FSGetNormalizedPath =
        Tcl_Obj*  function(Tcl_Interp* interp, Tcl_Obj* pathPtr);
    alias da_Tcl_FSJoinToPath =
        Tcl_Obj*  function(Tcl_Obj* pathPtr, int objc, const(Tcl_Obj*)[] objv);
    alias da_Tcl_FSGetInternalRep =
        ClientData function(Tcl_Obj* pathPtr, const(Tcl_Filesystem)* fsPtr);
    alias da_Tcl_FSGetTranslatedPath =
        Tcl_Obj*  function(Tcl_Interp* interp, Tcl_Obj* pathPtr);
    alias da_Tcl_FSEvalFile =
        int function(Tcl_Interp* interp, Tcl_Obj* fileName);
    alias da_Tcl_FSNewNativePath =
        Tcl_Obj*  function(const(Tcl_Filesystem)* fromFilesystem,
                           ClientData clientData);
    alias da_Tcl_FSGetNativePath = const void*  function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSFileSystemInfo = Tcl_Obj*  function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSPathSeparator = Tcl_Obj*  function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSListVolumes = Tcl_Obj*  function();
    alias da_Tcl_FSRegister =
        int function(ClientData clientData, const Tcl_Filesystem* fsPtr);
    alias da_Tcl_FSUnregister = int function(const Tcl_Filesystem* fsPtr);
    alias da_Tcl_FSData = ClientData function(const Tcl_Filesystem* fsPtr);
    alias da_Tcl_FSGetTranslatedStringPath =
        const(char)* function(Tcl_Interp* interp, Tcl_Obj* pathPtr);
    alias da_Tcl_FSGetFileSystemForPath =
        const(Tcl_Filesystem)* function(Tcl_Obj* pathPtr);
    alias da_Tcl_FSGetPathType = Tcl_PathType function(Tcl_Obj* pathPtr);
    alias da_Tcl_OutputBuffered = int function(Tcl_Channel chan);
    alias da_Tcl_FSMountsChanged = void function(const Tcl_Filesystem* fsPtr);
    alias da_Tcl_EvalTokensStandard =
        int function(Tcl_Interp* interp, Tcl_Token* tokenPtr, int count);
    alias da_Tcl_GetTime = void function(Tcl_Time* timeBuf);
    alias da_Tcl_CreateObjTrace =
        Tcl_Trace function(Tcl_Interp* interp, int level, int flags,
                           Tcl_CmdObjTraceProc objProc, ClientData clientData,
                           Tcl_CmdObjTraceDeleteProc delProc);
    alias da_Tcl_GetCommandInfoFromToken =
        int function(Tcl_Command token, Tcl_CmdInfo* infoPtr);
    alias da_Tcl_SetCommandInfoFromToken =
        int function(Tcl_Command token, const Tcl_CmdInfo* infoPtr);
    alias da_Tcl_DbNewWideIntObj =
        Tcl_Obj*  function(Tcl_WideInt wideValue, const(char)* file, int line);
    alias da_Tcl_GetWideIntFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, Tcl_WideInt* widePtr);
    alias da_Tcl_NewWideIntObj = Tcl_Obj*  function(Tcl_WideInt wideValue);
    alias da_Tcl_SetWideIntObj =
        void function(Tcl_Obj* objPtr, Tcl_WideInt wideValue);
    alias da_Tcl_AllocStatBuf = Tcl_StatBuf*  function();
    alias da_Tcl_Seek =
        Tcl_WideInt function(Tcl_Channel chan, Tcl_WideInt offset, int mode);
    alias da_Tcl_Tell = Tcl_WideInt function(Tcl_Channel chan);
    alias da_Tcl_ChannelWideSeekProc =
        Tcl_DriverWideSeekProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_DictObjPut =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, Tcl_Obj* keyPtr,
                     Tcl_Obj* valuePtr);
    alias da_Tcl_DictObjGet =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, Tcl_Obj* keyPtr,
                     Tcl_Obj** valuePtrPtr);
    alias da_Tcl_DictObjRemove =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, Tcl_Obj* keyPtr);
    alias da_Tcl_DictObjSize =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, int* sizePtr);
    alias da_Tcl_DictObjFirst =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr,
                     Tcl_DictSearch* searchPtr, Tcl_Obj** keyPtrPtr,
                     Tcl_Obj** valuePtrPtr, int* donePtr);
    alias da_Tcl_DictObjNext =
        void function(Tcl_DictSearch* searchPtr, Tcl_Obj** keyPtrPtr,
                      Tcl_Obj** valuePtrPtr, int* donePtr);
    alias da_Tcl_DictObjDone = void function(Tcl_DictSearch* searchPtr);
    alias da_Tcl_DictObjPutKeyList =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, int keyc,
                     const(Tcl_Obj*)* keyv, Tcl_Obj* valuePtr);
    alias da_Tcl_DictObjRemoveKeyList =
        int function(Tcl_Interp* interp, Tcl_Obj* dictPtr, int keyc,
                     const(Tcl_Obj*)* keyv);
    alias da_Tcl_NewDictObj = Tcl_Obj*  function();
    alias da_Tcl_DbNewDictObj = Tcl_Obj*  function(const(char)* file, int line);
    alias da_Tcl_RegisterConfig =
        void function(Tcl_Interp* interp, const(char)* pkgName,
                      const(Tcl_Config)* configuration,
                      const(char)* valEncoding);
    alias da_Tcl_CreateNamespace =
        Tcl_Namespace* function(Tcl_Interp* interp, const(char)* name,
                                ClientData clientData,
                                Tcl_NamespaceDeleteProc deleteProc);
    alias da_Tcl_DeleteNamespace = void function(Tcl_Namespace* nsPtr);
    alias da_Tcl_AppendExportList =
        int function(Tcl_Interp* interp, Tcl_Namespace* nsPtr, Tcl_Obj* objPtr);
    alias da_Tcl_Export =
        int function(Tcl_Interp* interp, Tcl_Namespace* nsPtr,
                     const(char)* pattern, int resetListFirst);
    alias da_Tcl_Import =
        int function(Tcl_Interp* interp, Tcl_Namespace* nsPtr,
                     const(char)* pattern, int allowOverwrite);
    alias da_Tcl_ForgetImport =
        int function(Tcl_Interp* interp, Tcl_Namespace* nsPtr,
                     const(char)* pattern);
    alias da_Tcl_GetCurrentNamespace =
        Tcl_Namespace* function(Tcl_Interp* interp);
    alias da_Tcl_GetGlobalNamespace =
        Tcl_Namespace* function(Tcl_Interp* interp);
    alias da_Tcl_FindNamespace =
        Tcl_Namespace* function(Tcl_Interp* interp, const(char)* name,
                                Tcl_Namespace* contextNsPtr, int flags);
    alias da_Tcl_FindCommand =
        Tcl_Command function(Tcl_Interp* interp, const(char)* name,
                             Tcl_Namespace* contextNsPtr, int flags);
    alias da_Tcl_GetCommandFromObj =
        Tcl_Command function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tcl_GetCommandFullName =
        void function(Tcl_Interp* interp, Tcl_Command command, Tcl_Obj* objPtr);
    alias da_Tcl_FSEvalFileEx =
        int function(Tcl_Interp* interp, Tcl_Obj* fileName,
                     const(char)* encodingName);
    alias da_Tcl_SetExitProc = Tcl_ExitProc  function(Tcl_ExitProc proc);
    alias da_Tcl_LimitAddHandler =
        void function(Tcl_Interp* interp, int type,
                      Tcl_LimitHandlerProc handlerProc, ClientData clientData,
                      Tcl_LimitHandlerDeleteProc deleteProc);
    alias da_Tcl_LimitRemoveHandler =
        void function(Tcl_Interp* interp, int type,
                      Tcl_LimitHandlerProc handlerProc, ClientData clientData);
    alias da_Tcl_LimitReady = int function(Tcl_Interp* interp);
    alias da_Tcl_LimitCheck = int function(Tcl_Interp* interp);
    alias da_Tcl_LimitExceeded = int function(Tcl_Interp* interp);
    alias da_Tcl_LimitSetCommands =
        void function(Tcl_Interp* interp, int commandLimit);
    alias da_Tcl_LimitSetTime =
        void function(Tcl_Interp* interp, Tcl_Time* timeLimitPtr);
    alias da_Tcl_LimitSetGranularity =
        void function(Tcl_Interp* interp, int type, int granularity);
    alias da_Tcl_LimitTypeEnabled = int function(Tcl_Interp* interp, int type);
    alias da_Tcl_LimitTypeExceeded = int function(Tcl_Interp* interp, int type);
    alias da_Tcl_LimitTypeSet = void function(Tcl_Interp* interp, int type);
    alias da_Tcl_LimitTypeReset = void function(Tcl_Interp* interp, int type);
    alias da_Tcl_LimitGetCommands = int function(Tcl_Interp* interp);
    alias da_Tcl_LimitGetTime =
        void function(Tcl_Interp* interp, Tcl_Time* timeLimitPtr);
    alias da_Tcl_LimitGetGranularity =
        int function(Tcl_Interp* interp, int type);
    alias da_Tcl_SaveInterpState =
        Tcl_InterpState function(Tcl_Interp* interp, int status);
    alias da_Tcl_RestoreInterpState =
        int function(Tcl_Interp* interp, Tcl_InterpState state);
    alias da_Tcl_DiscardInterpState = void function(Tcl_InterpState state);
    alias da_Tcl_SetReturnOptions =
        int function(Tcl_Interp* interp, Tcl_Obj* options);
    alias da_Tcl_GetReturnOptions =
        Tcl_Obj* function(Tcl_Interp* interp, int result);
    alias da_Tcl_IsEnsemble = int function(Tcl_Command token);
    alias da_Tcl_CreateEnsemble =
        Tcl_Command function(Tcl_Interp* interp, const(char)* name,
                             Tcl_Namespace* namespacePtr, int flags);
    alias da_Tcl_FindEnsemble =
        Tcl_Command function(Tcl_Interp* interp, Tcl_Obj* cmdNameObj,
                             int flags);
    alias da_Tcl_SetEnsembleSubcommandList =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj* subcmdList);
    alias da_Tcl_SetEnsembleMappingDict =
        int function(Tcl_Interp* interp, Tcl_Command token, Tcl_Obj* mapDict);
    alias da_Tcl_SetEnsembleUnknownHandler =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj* unknownList);
    alias da_Tcl_SetEnsembleFlags =
        int function(Tcl_Interp* interp, Tcl_Command token, int flags);
    alias da_Tcl_GetEnsembleSubcommandList =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj** subcmdListPtr);
    alias da_Tcl_GetEnsembleMappingDict =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj** mapDictPtr);
    alias da_Tcl_GetEnsembleUnknownHandler =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj** unknownListPtr);
    alias da_Tcl_GetEnsembleFlags =
        int function(Tcl_Interp* interp, Tcl_Command token, int* flagsPtr);
    alias da_Tcl_GetEnsembleNamespace =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Namespace** namespacePtrPtr);
    alias da_Tcl_SetTimeProc =
        void function(Tcl_GetTimeProc getProc, Tcl_ScaleTimeProc scaleProc,
                      ClientData clientData);
    alias da_Tcl_QueryTimeProc =
        void function(Tcl_GetTimeProc* getProc, Tcl_ScaleTimeProc* scaleProc,
                      ClientData* clientData);
    alias da_Tcl_ChannelThreadActionProc =
        Tcl_DriverThreadActionProc function(
            const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_NewBignumObj = Tcl_Obj*  function(mp_int* value);
    alias da_Tcl_DbNewBignumObj =
        Tcl_Obj*  function(mp_int* value, const(char)* file, int line);
    alias da_Tcl_SetBignumObj = void function(Tcl_Obj* obj, mp_int* value);
    alias da_Tcl_GetBignumFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* obj, mp_int* value);
    alias da_Tcl_TakeBignumFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* obj, mp_int* value);
    alias da_Tcl_TruncateChannel =
        int function(Tcl_Channel chan, Tcl_WideInt length);
    alias da_Tcl_ChannelTruncatePbroc =
        Tcl_DriverTruncateProc function(const(Tcl_ChannelType)* chanTypePtr);
    alias da_Tcl_SetChannelErrorInterp =
        void function(Tcl_Interp* interp, Tcl_Obj* msg);
    alias da_Tcl_GetChannelErrorInterp =
        void function(Tcl_Interp* interp, Tcl_Obj** msg);
    alias da_Tcl_SetChannelError =
        void function(Tcl_Channel chan, Tcl_Obj* msg);
    alias da_Tcl_GetChannelError =
        void function(Tcl_Channel chan, Tcl_Obj** msg);
    alias da_Tcl_InitBignumFromDouble =
        int function(Tcl_Interp* interp, double initval, mp_int* toInit);
    alias da_Tcl_GetNamespaceUnknownHandler =
        Tcl_Obj*  function(Tcl_Interp* interp, Tcl_Namespace* nsPtr);
    alias da_Tcl_SetNamespaceUnknownHandler =
        int function(Tcl_Interp* interp, Tcl_Namespace* nsPtr,
                     Tcl_Obj* handlerPtr);
    alias da_Tcl_GetEncodingFromObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr,
                     Tcl_Encoding* encodingPtr);
    alias da_Tcl_GetEncodingSearchPath = Tcl_Obj*  function();
    alias da_Tcl_SetEncodingSearchPath = int function(Tcl_Obj* searchPath);
    alias da_Tcl_GetEncodingNameFromEnvironment =
        const(char)* function(Tcl_DString* bufPtr);
    alias da_Tcl_PkgRequireProc =
        int function(Tcl_Interp* interp, const(char)* name, int objc,
                     const(Tcl_Obj*)* objv, void* clientDataPtr);
    alias da_Tcl_AppendObjToErrorInfo =
        void function(Tcl_Interp* interp, Tcl_Obj* objPtr);
    alias da_Tcl_AppendLimitedToObj =
        void function(Tcl_Obj* objPtr, const(char)* bytes, int length,
                      int limit, const(char)* ellipsis);
    alias da_Tcl_Format =
        Tcl_Obj* function(Tcl_Interp* interp, const(char)* format, int objc,
                          const(Tcl_Obj*)* objv);
    alias da_Tcl_AppendFormatToObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, const(char)* format,
                     int objc, const(Tcl_Obj*)* objv);
    alias da_Tcl_ObjPrintf = Tcl_Obj*  function(const(char)* format, ...);
    alias da_Tcl_AppendPrintfToObj =
        void function(Tcl_Obj* objPtr, const(char)* format, ...);
    alias da_Tcl_CancelEval =
        int function(Tcl_Interp* interp, Tcl_Obj* resultObjPtr,
                     ClientData clientData, int flags);
    alias da_Tcl_Canceled = int function(Tcl_Interp* interp, int flags);
    alias da_Tcl_CreatePipe =
        int function(Tcl_Interp* interp, Tcl_Channel* rchan, Tcl_Channel* wchan,
                     int flags);
    alias da_Tcl_NRCreateCommand =
        Tcl_Command function(Tcl_Interp* interp, const(char)* cmdName,
                             Tcl_ObjCmdProc proc, Tcl_ObjCmdProc nreProc,
                             ClientData clientData,
                             Tcl_CmdDeleteProc deleteProc);
    alias da_Tcl_NREvalObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int flags);
    alias da_Tcl_NREvalObjv =
        int function(Tcl_Interp* interp, int objc, const(Tcl_Obj*) objv,
                     int flags);
    alias da_Tcl_NRCmdSwap =
        int function(Tcl_Interp* interp, Tcl_Command cmd, int objc,
                     const(Tcl_Obj*)* objv, int flags);
    alias da_Tcl_NRAddCallback =
        void function(Tcl_Interp* interp, Tcl_NRPostProc postProcPtr,
                      ClientData data0, ClientData data1, ClientData data2,
                      ClientData data3);
    alias da_Tcl_NRCallObjProc =
        int function(Tcl_Interp* interp, Tcl_ObjCmdProc objProc,
                     ClientData clientData, int objc, const(Tcl_Obj*)* objv);
    alias da_Tcl_GetFSDeviceFromStat =
        uint function(const(Tcl_StatBuf)* statPtr);
    alias da_Tcl_GetFSInodeFromStat = uint function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetModeFromStat =uint function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetLinkCountFromStat =
        int function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetUserIdFromStat = int function(const(Tcl_StatBuf)* statPtr);
    alias da_Tcl_GetGroupIdFromStat = int function(const(Tcl_StatBuf)* statPtr);
    alias da_Tcl_GetDeviceTypeFromStat =
        int function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetAccessTimeFromStat =
        Tcl_WideInt function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetModificationTimeFromStat =
        Tcl_WideInt function(const(Tcl_StatBuf)* statPtr);
    alias da_Tcl_GetChangeTimeFromStat =
        Tcl_WideInt function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetSizeFromStat =
        Tcl_WideUInt function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetBlocksFromStat =
        Tcl_WideUInt function(const Tcl_StatBuf* statPtr);
    alias da_Tcl_GetBlockSizeFromStat =
        uint function(const(Tcl_StatBuf)* statPtr);
    alias da_Tcl_SetEnsembleParameterList =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj* paramList);
    alias da_Tcl_GetEnsembleParameterList =
        int function(Tcl_Interp* interp, Tcl_Command token,
                     Tcl_Obj** paramListPtr);
    alias da_Tcl_ParseArgsObjv =
        int function(Tcl_Interp* interp, const(Tcl_ArgvInfo)* argTable,
                     int* objcPtr, const(Tcl_Obj*)* objv, Tcl_Obj*** remObjv);
    alias da_Tcl_GetErrorLine = int function(Tcl_Interp* interp);
    alias da_Tcl_SetErrorLine = void function(Tcl_Interp* interp, int lineNum);
    alias da_Tcl_TransferResult =
        void function(Tcl_Interp* sourceInterp, int result,
                      Tcl_Interp* targetInterp);
    alias da_Tcl_InterpActive = int function(Tcl_Interp* interp);
    alias da_Tcl_BackgroundException =
        void function(Tcl_Interp* interp, int code);
    alias da_Tcl_ZlibDeflate =
        int function(Tcl_Interp* interp, int format, Tcl_Obj* data, int level,
                     Tcl_Obj* gzipHeaderDictObj);
    alias da_Tcl_ZlibInflate =
        int function(Tcl_Interp* interp, int format, Tcl_Obj* data,
                     int buffersize, Tcl_Obj* gzipHeaderDictObj);
    alias da_Tcl_ZlibCRC32 =
        uint function(uint crc, const(ubyte)* buf, int len);
    alias da_Tcl_ZlibAdler32 =
        uint function(uint adler, const(ubyte)* buf, int len);
    alias da_Tcl_ZlibStreamInit =
        int function(Tcl_Interp* interp, int mode, int format,
                     int level, Tcl_Obj* dictObj, Tcl_ZlibStream* zshandle);
    alias da_Tcl_ZlibStreamGetCommandName =
        Tcl_Obj*  function(Tcl_ZlibStream zshandle);
    alias da_Tcl_ZlibStreamEof = int function(Tcl_ZlibStream zshandle);
    alias da_Tcl_ZlibStreamChecksum = int function(Tcl_ZlibStream zshandle);
    alias da_Tcl_ZlibStreamPut =
        int function(Tcl_ZlibStream zshandle, Tcl_Obj* data, int flush);
    alias da_Tcl_ZlibStreamGet =
        int function(Tcl_ZlibStream zshandle, Tcl_Obj* data, int count);
    alias da_Tcl_ZlibStreamClose = int function(Tcl_ZlibStream zshandle);
    alias da_Tcl_ZlibStreamReset = int function(Tcl_ZlibStream zshandle);
    alias da_Tcl_SetStartupScript =
        void function(Tcl_Obj* path, const(char)* encoding);
    alias da_Tcl_GetStartupScript =
        Tcl_Obj*  function(const(char)** encodingPtr);
    alias da_Tcl_CloseEx =
        int function(Tcl_Interp* interp, Tcl_Channel chan, int flags);
    alias da_Tcl_NRExprObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, Tcl_Obj* resultPtr);
    alias da_Tcl_NRSubstObj =
        int function(Tcl_Interp* interp, Tcl_Obj* objPtr, int flags);
    alias da_Tcl_LoadFile =
        int function(Tcl_Interp* interp, Tcl_Obj* pathPtr,
                     const(const(char)*)* symv, int flags,
                     void* procPtrs, Tcl_LoadHandle* handlePtr);
    alias da_Tcl_FindSymbol =
        void*  function(Tcl_Interp* interp, Tcl_LoadHandle handle,
                        const(char)* symbol);
    alias da_Tcl_FSUnloadFile =
        int function(Tcl_Interp* interp, Tcl_LoadHandle handlePtr);
    alias da_Tcl_ZlibStreamSetCompressionDictionary =
        void function(Tcl_ZlibStream zhandle,
                      Tcl_Obj* compressionDictionaryObj);
}

__gshared
{
    da_Tcl_Access Tcl_Access;
    da_Tcl_AddErrorInfo Tcl_AddErrorInfo;
    // da_Tcl_AddInterpResolvers Tcl_AddInterpResolvers;
    da_Tcl_AddObjErrorInfo Tcl_AddObjErrorInfo;
    da_Tcl_AlertNotifier Tcl_AlertNotifier;
    da_Tcl_Alloc Tcl_Alloc;
    da_Tcl_AllocStatBuf Tcl_AllocStatBuf;
    da_Tcl_AllowExceptions Tcl_AllowExceptions;
    da_Tcl_AppendAllObjTypes Tcl_AppendAllObjTypes;
    da_Tcl_AppendElement Tcl_AppendElement;
    da_Tcl_AppendExportList Tcl_AppendExportList;
    da_Tcl_AppendFormatToObj Tcl_AppendFormatToObj;
    da_Tcl_AppendLimitedToObj Tcl_AppendLimitedToObj;
    da_Tcl_AppendObjToErrorInfo Tcl_AppendObjToErrorInfo;
    da_Tcl_AppendObjToObj Tcl_AppendObjToObj;
    da_Tcl_AppendPrintfToObj Tcl_AppendPrintfToObj;
    da_Tcl_AppendResult Tcl_AppendResult;
    da_Tcl_AppendResultVA Tcl_AppendResultVA;
    da_Tcl_AppendStringsToObj Tcl_AppendStringsToObj;
    da_Tcl_AppendStringsToObjVA Tcl_AppendStringsToObjVA;
    da_Tcl_AppendToObj Tcl_AppendToObj;
    da_Tcl_AppendUnicodeToObj Tcl_AppendUnicodeToObj;
    da_Tcl_AsyncCreate Tcl_AsyncCreate;
    da_Tcl_AsyncDelete Tcl_AsyncDelete;
    da_Tcl_AsyncInvoke Tcl_AsyncInvoke;
    da_Tcl_AsyncMark Tcl_AsyncMark;
    da_Tcl_AsyncReady Tcl_AsyncReady;
    da_Tcl_AttemptAlloc Tcl_AttemptAlloc;
    da_Tcl_AttemptDbCkalloc Tcl_AttemptDbCkalloc;
    da_Tcl_AttemptDbCkrealloc Tcl_AttemptDbCkrealloc;
    da_Tcl_AttemptRealloc Tcl_AttemptRealloc;
    da_Tcl_AttemptSetObjLength Tcl_AttemptSetObjLength;
    da_Tcl_BackgroundError Tcl_BackgroundError;
    da_Tcl_BackgroundException Tcl_BackgroundException;
    da_Tcl_Backslash Tcl_Backslash;
    da_Tcl_BadChannelOption Tcl_BadChannelOption;
    da_Tcl_CallWhenDeleted Tcl_CallWhenDeleted;
    da_Tcl_CancelEval Tcl_CancelEval;
    da_Tcl_CancelIdleCall Tcl_CancelIdleCall;
    da_Tcl_Canceled Tcl_Canceled;
    da_Tcl_ChannelBlockModeProc Tcl_ChannelBlockModeProc;
    da_Tcl_ChannelBuffered Tcl_ChannelBuffered;
    da_Tcl_ChannelClose2Proc Tcl_ChannelClose2Proc;
    da_Tcl_ChannelCloseProc Tcl_ChannelCloseProc;
    da_Tcl_ChannelFlushProc Tcl_ChannelFlushProc;
    da_Tcl_ChannelGetHandleProc Tcl_ChannelGetHandleProc;
    da_Tcl_ChannelGetOptionProc Tcl_ChannelGetOptionProc;
    da_Tcl_ChannelHandlerProc Tcl_ChannelHandlerProc;
    da_Tcl_ChannelInputProc Tcl_ChannelInputProc;
    da_Tcl_ChannelName Tcl_ChannelName;
    da_Tcl_ChannelOutputProc Tcl_ChannelOutputProc;
    da_Tcl_ChannelSeekProc Tcl_ChannelSeekProc;
    da_Tcl_ChannelSetOptionProc Tcl_ChannelSetOptionProc;
    da_Tcl_ChannelThreadActionProc Tcl_ChannelThreadActionProc;
    // da_Tcl_ChannelTruncateProc Tcl_ChannelTruncateProc;
    da_Tcl_ChannelVersion Tcl_ChannelVersion;
    da_Tcl_ChannelWatchProc Tcl_ChannelWatchProc;
    da_Tcl_ChannelWideSeekProc Tcl_ChannelWideSeekProc;
    da_Tcl_Chdir Tcl_Chdir;
    da_Tcl_ClearChannelHandlers Tcl_ClearChannelHandlers;
    da_Tcl_Close Tcl_Close;
    da_Tcl_CloseEx Tcl_CloseEx;
    da_Tcl_CommandComplete Tcl_CommandComplete;
    da_Tcl_CommandTraceInfo Tcl_CommandTraceInfo;
    da_Tcl_Concat Tcl_Concat;
    da_Tcl_ConcatObj Tcl_ConcatObj;
    da_Tcl_ConditionFinalize Tcl_ConditionFinalize;
    da_Tcl_ConditionNotify Tcl_ConditionNotify;
    da_Tcl_ConditionWait Tcl_ConditionWait;
    da_Tcl_ConvertCountedElement Tcl_ConvertCountedElement;
    da_Tcl_ConvertElement Tcl_ConvertElement;
    da_Tcl_ConvertToType Tcl_ConvertToType;
    da_Tcl_CreateAlias Tcl_CreateAlias;
    da_Tcl_CreateAliasObj Tcl_CreateAliasObj;
    da_Tcl_CreateChannel Tcl_CreateChannel;
    da_Tcl_CreateChannelHandler Tcl_CreateChannelHandler;
    da_Tcl_CreateCloseHandler Tcl_CreateCloseHandler;
    da_Tcl_CreateCommand Tcl_CreateCommand;
    da_Tcl_CreateEncoding Tcl_CreateEncoding;
    da_Tcl_CreateEnsemble Tcl_CreateEnsemble;
    da_Tcl_CreateEventSource Tcl_CreateEventSource;
    da_Tcl_CreateExitHandler Tcl_CreateExitHandler;
    da_Tcl_CreateHashEntry Tcl_CreateHashEntry;
    da_Tcl_CreateInterp Tcl_CreateInterp;
    da_Tcl_CreateMathFunc Tcl_CreateMathFunc;
    da_Tcl_CreateNamespace Tcl_CreateNamespace;
    da_Tcl_CreateObjCommand Tcl_CreateObjCommand;
    da_Tcl_CreateObjTrace Tcl_CreateObjTrace;
    da_Tcl_CreatePipe Tcl_CreatePipe;
    da_Tcl_CreateSlave Tcl_CreateSlave;
    da_Tcl_CreateThread Tcl_CreateThread;
    da_Tcl_CreateThreadExitHandler Tcl_CreateThreadExitHandler;
    da_Tcl_CreateTimerHandler Tcl_CreateTimerHandler;
    da_Tcl_CreateTrace Tcl_CreateTrace;
    da_Tcl_CutChannel Tcl_CutChannel;
    da_Tcl_DStringAppend Tcl_DStringAppend;
    da_Tcl_DStringAppendElement Tcl_DStringAppendElement;
    da_Tcl_DStringEndSublist Tcl_DStringEndSublist;
    da_Tcl_DStringFree Tcl_DStringFree;
    da_Tcl_DStringGetResult Tcl_DStringGetResult;
    da_Tcl_DStringInit Tcl_DStringInit;
    da_Tcl_DStringResult Tcl_DStringResult;
    da_Tcl_DStringSetLength Tcl_DStringSetLength;
    da_Tcl_DStringStartSublist Tcl_DStringStartSublist;
    da_Tcl_DbCkalloc Tcl_DbCkalloc;
    da_Tcl_DbCkfree Tcl_DbCkfree;
    da_Tcl_DbCkrealloc Tcl_DbCkrealloc;
    da_Tcl_DbDecrRefCount Tcl_DbDecrRefCount;
    da_Tcl_DbIncrRefCount Tcl_DbIncrRefCount;
    da_Tcl_DbIsShared Tcl_DbIsShared;
    da_Tcl_DbNewBignumObj Tcl_DbNewBignumObj;
    da_Tcl_DbNewBooleanObj Tcl_DbNewBooleanObj;
    da_Tcl_DbNewByteArrayObj Tcl_DbNewByteArrayObj;
    da_Tcl_DbNewDictObj Tcl_DbNewDictObj;
    da_Tcl_DbNewDoubleObj Tcl_DbNewDoubleObj;
    da_Tcl_DbNewListObj Tcl_DbNewListObj;
    da_Tcl_DbNewLongObj Tcl_DbNewLongObj;
    da_Tcl_DbNewObj Tcl_DbNewObj;
    da_Tcl_DbNewStringObj Tcl_DbNewStringObj;
    da_Tcl_DbNewWideIntObj Tcl_DbNewWideIntObj;
    da_Tcl_DeleteAssocData Tcl_DeleteAssocData;
    da_Tcl_DeleteChannelHandler Tcl_DeleteChannelHandler;
    da_Tcl_DeleteCloseHandler Tcl_DeleteCloseHandler;
    da_Tcl_DeleteCommand Tcl_DeleteCommand;
    da_Tcl_DeleteCommandFromToken Tcl_DeleteCommandFromToken;
    da_Tcl_DeleteEventSource Tcl_DeleteEventSource;
    da_Tcl_DeleteEvents Tcl_DeleteEvents;
    da_Tcl_DeleteExitHandler Tcl_DeleteExitHandler;
    da_Tcl_DeleteHashEntry Tcl_DeleteHashEntry;
    da_Tcl_DeleteHashTable Tcl_DeleteHashTable;
    da_Tcl_DeleteInterp Tcl_DeleteInterp;
    da_Tcl_DeleteNamespace Tcl_DeleteNamespace;
    da_Tcl_DeleteThreadExitHandler Tcl_DeleteThreadExitHandler;
    da_Tcl_DeleteTimerHandler Tcl_DeleteTimerHandler;
    da_Tcl_DeleteTrace Tcl_DeleteTrace;
    da_Tcl_DetachChannel Tcl_DetachChannel;
    da_Tcl_DetachPids Tcl_DetachPids;
    da_Tcl_DictObjDone Tcl_DictObjDone;
    da_Tcl_DictObjFirst Tcl_DictObjFirst;
    da_Tcl_DictObjGet Tcl_DictObjGet;
    da_Tcl_DictObjNext Tcl_DictObjNext;
    da_Tcl_DictObjPut Tcl_DictObjPut;
    da_Tcl_DictObjPutKeyList Tcl_DictObjPutKeyList;
    da_Tcl_DictObjRemove Tcl_DictObjRemove;
    da_Tcl_DictObjRemoveKeyList Tcl_DictObjRemoveKeyList;
    da_Tcl_DictObjSize Tcl_DictObjSize;
    da_Tcl_DiscardInterpState Tcl_DiscardInterpState;
    da_Tcl_DiscardResult Tcl_DiscardResult;
    da_Tcl_DoOneEvent Tcl_DoOneEvent;
    da_Tcl_DoWhenIdle Tcl_DoWhenIdle;
    da_Tcl_DontCallWhenDeleted Tcl_DontCallWhenDeleted;
    da_Tcl_DumpActiveMemory Tcl_DumpActiveMemory;
    da_Tcl_DuplicateObj Tcl_DuplicateObj;
    da_Tcl_Eof Tcl_Eof;
    da_Tcl_ErrnoId Tcl_ErrnoId;
    da_Tcl_ErrnoMsg Tcl_ErrnoMsg;
    da_Tcl_Eval Tcl_Eval;
    da_Tcl_EvalEx Tcl_EvalEx;
    da_Tcl_EvalFile Tcl_EvalFile;
    da_Tcl_EvalObj Tcl_EvalObj;
    da_Tcl_EvalObjEx Tcl_EvalObjEx;
    da_Tcl_EvalObjv Tcl_EvalObjv;
    da_Tcl_EvalTokens Tcl_EvalTokens;
    da_Tcl_EvalTokensStandard Tcl_EvalTokensStandard;
    da_Tcl_EventuallyFree Tcl_EventuallyFree;
    da_Tcl_Exit Tcl_Exit;
    da_Tcl_ExitThread Tcl_ExitThread;
    da_Tcl_Export Tcl_Export;
    da_Tcl_ExposeCommand Tcl_ExposeCommand;
    da_Tcl_ExprBoolean Tcl_ExprBoolean;
    da_Tcl_ExprBooleanObj Tcl_ExprBooleanObj;
    da_Tcl_ExprDouble Tcl_ExprDouble;
    da_Tcl_ExprDoubleObj Tcl_ExprDoubleObj;
    da_Tcl_ExprLong Tcl_ExprLong;
    da_Tcl_ExprLongObj Tcl_ExprLongObj;
    da_Tcl_ExprObj Tcl_ExprObj;
    da_Tcl_ExprString Tcl_ExprString;
    da_Tcl_ExternalToUtf Tcl_ExternalToUtf;
    da_Tcl_ExternalToUtfDString Tcl_ExternalToUtfDString;
    da_Tcl_FSAccess Tcl_FSAccess;
    da_Tcl_FSChdir Tcl_FSChdir;
    da_Tcl_FSConvertToPathType Tcl_FSConvertToPathType;
    da_Tcl_FSCopyDirectory Tcl_FSCopyDirectory;
    da_Tcl_FSCopyFile Tcl_FSCopyFile;
    da_Tcl_FSCreateDirectory Tcl_FSCreateDirectory;
    da_Tcl_FSData Tcl_FSData;
    da_Tcl_FSDeleteFile Tcl_FSDeleteFile;
    da_Tcl_FSEqualPaths Tcl_FSEqualPaths;
    da_Tcl_FSEvalFile Tcl_FSEvalFile;
    da_Tcl_FSEvalFileEx Tcl_FSEvalFileEx;
    da_Tcl_FSFileAttrStrings Tcl_FSFileAttrStrings;
    da_Tcl_FSFileAttrsGet Tcl_FSFileAttrsGet;
    da_Tcl_FSFileAttrsSet Tcl_FSFileAttrsSet;
    da_Tcl_FSFileSystemInfo Tcl_FSFileSystemInfo;
    da_Tcl_FSGetCwd Tcl_FSGetCwd;
    da_Tcl_FSGetFileSystemForPath Tcl_FSGetFileSystemForPath;
    da_Tcl_FSGetInternalRep Tcl_FSGetInternalRep;
    da_Tcl_FSGetNativePath Tcl_FSGetNativePath;
    da_Tcl_FSGetNormalizedPath Tcl_FSGetNormalizedPath;
    da_Tcl_FSGetPathType Tcl_FSGetPathType;
    da_Tcl_FSGetTranslatedPath Tcl_FSGetTranslatedPath;
    da_Tcl_FSGetTranslatedStringPath Tcl_FSGetTranslatedStringPath;
    da_Tcl_FSJoinPath Tcl_FSJoinPath;
    da_Tcl_FSJoinToPath Tcl_FSJoinToPath;
    da_Tcl_FSLink Tcl_FSLink;
    da_Tcl_FSListVolumes Tcl_FSListVolumes;
    da_Tcl_FSLoadFile Tcl_FSLoadFile;
    da_Tcl_FSLstat Tcl_FSLstat;
    da_Tcl_FSMatchInDirectory Tcl_FSMatchInDirectory;
    da_Tcl_FSMountsChanged Tcl_FSMountsChanged;
    da_Tcl_FSNewNativePath Tcl_FSNewNativePath;
    da_Tcl_FSOpenFileChannel Tcl_FSOpenFileChannel;
    da_Tcl_FSPathSeparator Tcl_FSPathSeparator;
    da_Tcl_FSRegister Tcl_FSRegister;
    da_Tcl_FSRemoveDirectory Tcl_FSRemoveDirectory;
    da_Tcl_FSRenameFile Tcl_FSRenameFile;
    da_Tcl_FSSplitPath Tcl_FSSplitPath;
    da_Tcl_FSStat Tcl_FSStat;
    da_Tcl_FSUnloadFile Tcl_FSUnloadFile;
    da_Tcl_FSUnregister Tcl_FSUnregister;
    da_Tcl_FSUtime Tcl_FSUtime;
    da_Tcl_Finalize Tcl_Finalize;
    da_Tcl_FinalizeNotifier Tcl_FinalizeNotifier;
    da_Tcl_FinalizeThread Tcl_FinalizeThread;
    da_Tcl_FindCommand Tcl_FindCommand;
    da_Tcl_FindEnsemble Tcl_FindEnsemble;
    da_Tcl_FindExecutable Tcl_FindExecutable;
    da_Tcl_FindHashEntry Tcl_FindHashEntry;
    da_Tcl_FindNamespace Tcl_FindNamespace;
    // da_Tcl_FindNamespaceVar Tcl_FindNamespaceVar;
    da_Tcl_FindSymbol Tcl_FindSymbol;
    da_Tcl_FirstHashEntry Tcl_FirstHashEntry;
    da_Tcl_Flush Tcl_Flush;
    da_Tcl_ForgetImport Tcl_ForgetImport;
    da_Tcl_Format Tcl_Format;
    da_Tcl_Free Tcl_Free;
    da_Tcl_FreeEncoding Tcl_FreeEncoding;
    da_Tcl_FreeParse Tcl_FreeParse;
    da_Tcl_FreeResult Tcl_FreeResult;
    da_Tcl_GetAccessTimeFromStat Tcl_GetAccessTimeFromStat;
    da_Tcl_GetAlias Tcl_GetAlias;
    da_Tcl_GetAliasObj Tcl_GetAliasObj;
    da_Tcl_GetAllocMutex Tcl_GetAllocMutex;
    da_Tcl_GetAssocData Tcl_GetAssocData;
    da_Tcl_GetBignumFromObj Tcl_GetBignumFromObj;
    da_Tcl_GetBlockSizeFromStat Tcl_GetBlockSizeFromStat;
    da_Tcl_GetBlocksFromStat Tcl_GetBlocksFromStat;
    da_Tcl_GetBoolean Tcl_GetBoolean;
    da_Tcl_GetBooleanFromObj Tcl_GetBooleanFromObj;
    da_Tcl_GetByteArrayFromObj Tcl_GetByteArrayFromObj;
    da_Tcl_GetChangeTimeFromStat Tcl_GetChangeTimeFromStat;
    da_Tcl_GetChannel Tcl_GetChannel;
    da_Tcl_GetChannelBufferSize Tcl_GetChannelBufferSize;
    da_Tcl_GetChannelError Tcl_GetChannelError;
    da_Tcl_GetChannelErrorInterp Tcl_GetChannelErrorInterp;
    da_Tcl_GetChannelHandle Tcl_GetChannelHandle;
    da_Tcl_GetChannelInstanceData Tcl_GetChannelInstanceData;
    da_Tcl_GetChannelMode Tcl_GetChannelMode;
    da_Tcl_GetChannelName Tcl_GetChannelName;
    da_Tcl_GetChannelNames Tcl_GetChannelNames;
    da_Tcl_GetChannelNamesEx Tcl_GetChannelNamesEx;
    da_Tcl_GetChannelOption Tcl_GetChannelOption;
    da_Tcl_GetChannelThread Tcl_GetChannelThread;
    da_Tcl_GetChannelType Tcl_GetChannelType;
    da_Tcl_GetCharLength Tcl_GetCharLength;
    da_Tcl_GetCommandFromObj Tcl_GetCommandFromObj;
    da_Tcl_GetCommandFullName Tcl_GetCommandFullName;
    da_Tcl_GetCommandInfo Tcl_GetCommandInfo;
    da_Tcl_GetCommandInfoFromToken Tcl_GetCommandInfoFromToken;
    da_Tcl_GetCommandName Tcl_GetCommandName;
    da_Tcl_GetCurrentNamespace Tcl_GetCurrentNamespace;
    da_Tcl_GetCurrentThread Tcl_GetCurrentThread;
    da_Tcl_GetCwd Tcl_GetCwd;
    da_Tcl_GetDefaultEncodingDir Tcl_GetDefaultEncodingDir;
    da_Tcl_GetDeviceTypeFromStat Tcl_GetDeviceTypeFromStat;
    da_Tcl_GetDouble Tcl_GetDouble;
    da_Tcl_GetDoubleFromObj Tcl_GetDoubleFromObj;
    da_Tcl_GetEncoding Tcl_GetEncoding;
    da_Tcl_GetEncodingFromObj Tcl_GetEncodingFromObj;
    da_Tcl_GetEncodingName Tcl_GetEncodingName;
    da_Tcl_GetEncodingNameFromEnvironment Tcl_GetEncodingNameFromEnvironment;
    da_Tcl_GetEncodingNames Tcl_GetEncodingNames;
    da_Tcl_GetEncodingSearchPath Tcl_GetEncodingSearchPath;
    da_Tcl_GetEnsembleFlags Tcl_GetEnsembleFlags;
    da_Tcl_GetEnsembleMappingDict Tcl_GetEnsembleMappingDict;
    da_Tcl_GetEnsembleNamespace Tcl_GetEnsembleNamespace;
    da_Tcl_GetEnsembleParameterList Tcl_GetEnsembleParameterList;
    da_Tcl_GetEnsembleSubcommandList Tcl_GetEnsembleSubcommandList;
    da_Tcl_GetEnsembleUnknownHandler Tcl_GetEnsembleUnknownHandler;
    da_Tcl_GetErrno Tcl_GetErrno;
    da_Tcl_GetErrorLine Tcl_GetErrorLine;
    da_Tcl_GetFSDeviceFromStat Tcl_GetFSDeviceFromStat;
    da_Tcl_GetFSInodeFromStat Tcl_GetFSInodeFromStat;
    da_Tcl_GetGlobalNamespace Tcl_GetGlobalNamespace;
    da_Tcl_GetGroupIdFromStat Tcl_GetGroupIdFromStat;
    da_Tcl_GetHostName Tcl_GetHostName;
    da_Tcl_GetIndexFromObj Tcl_GetIndexFromObj;
    da_Tcl_GetIndexFromObjStruct Tcl_GetIndexFromObjStruct;
    da_Tcl_GetInt Tcl_GetInt;
    da_Tcl_GetIntFromObj Tcl_GetIntFromObj;
    da_Tcl_GetInterpPath Tcl_GetInterpPath;
    // da_Tcl_GetInterpResolvers Tcl_GetInterpResolvers;
    da_Tcl_GetLinkCountFromStat Tcl_GetLinkCountFromStat;
    da_Tcl_GetLongFromObj Tcl_GetLongFromObj;
    da_Tcl_GetMaster Tcl_GetMaster;
    da_Tcl_GetMathFuncInfo Tcl_GetMathFuncInfo;
    // da_Tcl_GetMemoryInfo Tcl_GetMemoryInfo;
    da_Tcl_GetModeFromStat Tcl_GetModeFromStat;
    da_Tcl_GetModificationTimeFromStat Tcl_GetModificationTimeFromStat;
    da_Tcl_GetNameOfExecutable Tcl_GetNameOfExecutable;
    // da_Tcl_GetNamespaceResolvers Tcl_GetNamespaceResolvers;
    da_Tcl_GetNamespaceUnknownHandler Tcl_GetNamespaceUnknownHandler;
    da_Tcl_GetObjResult Tcl_GetObjResult;
    da_Tcl_GetObjType Tcl_GetObjType;
    da_Tcl_GetPathType Tcl_GetPathType;
    da_Tcl_GetRange Tcl_GetRange;
    da_Tcl_GetRegExpFromObj Tcl_GetRegExpFromObj;
    da_Tcl_GetReturnOptions Tcl_GetReturnOptions;
    da_Tcl_GetServiceMode Tcl_GetServiceMode;
    da_Tcl_GetSizeFromStat Tcl_GetSizeFromStat;
    da_Tcl_GetSlave Tcl_GetSlave;
    da_Tcl_GetStackedChannel Tcl_GetStackedChannel;
    da_Tcl_GetStartupScript Tcl_GetStartupScript;
    da_Tcl_GetStdChannel Tcl_GetStdChannel;
    da_Tcl_GetString Tcl_GetString;
    da_Tcl_GetStringFromObj Tcl_GetStringFromObj;
    da_Tcl_GetStringResult Tcl_GetStringResult;
    da_Tcl_GetThreadData Tcl_GetThreadData;
    da_Tcl_GetTime Tcl_GetTime;
    da_Tcl_GetTopChannel Tcl_GetTopChannel;
    da_Tcl_GetUniChar Tcl_GetUniChar;
    da_Tcl_GetUnicode Tcl_GetUnicode;
    da_Tcl_GetUnicodeFromObj Tcl_GetUnicodeFromObj;
    da_Tcl_GetUserIdFromStat Tcl_GetUserIdFromStat;
    da_Tcl_GetVar Tcl_GetVar;
    da_Tcl_GetVar2 Tcl_GetVar2;
    da_Tcl_GetVar2Ex Tcl_GetVar2Ex;
    // da_Tcl_GetVariableFullName Tcl_GetVariableFullName;
    da_Tcl_GetVersion Tcl_GetVersion;
    da_Tcl_GetWideIntFromObj Tcl_GetWideIntFromObj;
    da_Tcl_Gets Tcl_Gets;
    da_Tcl_GetsObj Tcl_GetsObj;
    da_Tcl_GlobalEval Tcl_GlobalEval;
    da_Tcl_GlobalEvalObj Tcl_GlobalEvalObj;
    da_Tcl_HashStats Tcl_HashStats;
    da_Tcl_HideCommand Tcl_HideCommand;
    da_Tcl_Import Tcl_Import;
    da_Tcl_Init Tcl_Init;
    da_Tcl_InitBignumFromDouble Tcl_InitBignumFromDouble;
    da_Tcl_InitCustomHashTable Tcl_InitCustomHashTable;
    da_Tcl_InitHashTable Tcl_InitHashTable;
    da_Tcl_InitMemory Tcl_InitMemory;
    da_Tcl_InitNotifier Tcl_InitNotifier;
    da_Tcl_InitObjHashTable Tcl_InitObjHashTable;
    da_Tcl_InputBlocked Tcl_InputBlocked;
    da_Tcl_InputBuffered Tcl_InputBuffered;
    da_Tcl_InterpActive Tcl_InterpActive;
    da_Tcl_InterpDeleted Tcl_InterpDeleted;
    da_Tcl_InvalidateStringRep Tcl_InvalidateStringRep;
    da_Tcl_IsChannelExisting Tcl_IsChannelExisting;
    da_Tcl_IsChannelRegistered Tcl_IsChannelRegistered;
    da_Tcl_IsChannelShared Tcl_IsChannelShared;
    da_Tcl_IsEnsemble Tcl_IsEnsemble;
    da_Tcl_IsSafe Tcl_IsSafe;
    da_Tcl_IsStandardChannel Tcl_IsStandardChannel;
    da_Tcl_JoinPath Tcl_JoinPath;
    da_Tcl_JoinThread Tcl_JoinThread;
    da_Tcl_LimitAddHandler Tcl_LimitAddHandler;
    da_Tcl_LimitCheck Tcl_LimitCheck;
    da_Tcl_LimitExceeded Tcl_LimitExceeded;
    da_Tcl_LimitGetCommands Tcl_LimitGetCommands;
    da_Tcl_LimitGetGranularity Tcl_LimitGetGranularity;
    da_Tcl_LimitGetTime Tcl_LimitGetTime;
    da_Tcl_LimitReady Tcl_LimitReady;
    da_Tcl_LimitRemoveHandler Tcl_LimitRemoveHandler;
    da_Tcl_LimitSetCommands Tcl_LimitSetCommands;
    da_Tcl_LimitSetGranularity Tcl_LimitSetGranularity;
    da_Tcl_LimitSetTime Tcl_LimitSetTime;
    da_Tcl_LimitTypeEnabled Tcl_LimitTypeEnabled;
    da_Tcl_LimitTypeExceeded Tcl_LimitTypeExceeded;
    da_Tcl_LimitTypeReset Tcl_LimitTypeReset;
    da_Tcl_LimitTypeSet Tcl_LimitTypeSet;
    da_Tcl_LinkVar Tcl_LinkVar;
    da_Tcl_ListMathFuncs Tcl_ListMathFuncs;
    da_Tcl_ListObjAppendElement Tcl_ListObjAppendElement;
    da_Tcl_ListObjAppendList Tcl_ListObjAppendList;
    da_Tcl_ListObjGetElements Tcl_ListObjGetElements;
    da_Tcl_ListObjIndex Tcl_ListObjIndex;
    da_Tcl_ListObjLength Tcl_ListObjLength;
    da_Tcl_ListObjReplace Tcl_ListObjReplace;
    da_Tcl_LoadFile Tcl_LoadFile;
    da_Tcl_LogCommandInfo Tcl_LogCommandInfo;
    // da_Tcl_Main Tcl_Main;
    // da_Tcl_MainEx Tcl_MainEx;
    // da_Tcl_MainExW Tcl_MainExW;
    da_Tcl_MakeFileChannel Tcl_MakeFileChannel;
    da_Tcl_MakeSafe Tcl_MakeSafe;
    da_Tcl_MakeTcpClientChannel Tcl_MakeTcpClientChannel;
    da_Tcl_Merge Tcl_Merge;
    da_Tcl_MutexFinalize Tcl_MutexFinalize;
    da_Tcl_MutexLock Tcl_MutexLock;
    da_Tcl_MutexUnlock Tcl_MutexUnlock;
    da_Tcl_NRAddCallback Tcl_NRAddCallback;
    da_Tcl_NRCallObjProc Tcl_NRCallObjProc;
    da_Tcl_NRCmdSwap Tcl_NRCmdSwap;
    da_Tcl_NRCreateCommand Tcl_NRCreateCommand;
    da_Tcl_NREvalObj Tcl_NREvalObj;
    da_Tcl_NREvalObjv Tcl_NREvalObjv;
    da_Tcl_NRExprObj Tcl_NRExprObj;
    da_Tcl_NRSubstObj Tcl_NRSubstObj;
    da_Tcl_NewBignumObj Tcl_NewBignumObj;
    da_Tcl_NewBooleanObj Tcl_NewBooleanObj;
    da_Tcl_NewByteArrayObj Tcl_NewByteArrayObj;
    da_Tcl_NewDictObj Tcl_NewDictObj;
    da_Tcl_NewDoubleObj Tcl_NewDoubleObj;
    da_Tcl_NewIntObj Tcl_NewIntObj;
    da_Tcl_NewListObj Tcl_NewListObj;
    da_Tcl_NewLongObj Tcl_NewLongObj;
    da_Tcl_NewObj Tcl_NewObj;
    da_Tcl_NewStringObj Tcl_NewStringObj;
    da_Tcl_NewUnicodeObj Tcl_NewUnicodeObj;
    da_Tcl_NewWideIntObj Tcl_NewWideIntObj;
    da_Tcl_NextHashEntry Tcl_NextHashEntry;
    da_Tcl_NotifyChannel Tcl_NotifyChannel;
    da_Tcl_NumUtfChars Tcl_NumUtfChars;
    da_Tcl_ObjGetVar2 Tcl_ObjGetVar2;
    da_Tcl_ObjPrintf Tcl_ObjPrintf;
    da_Tcl_ObjSetVar2 Tcl_ObjSetVar2;
    da_Tcl_OpenCommandChannel Tcl_OpenCommandChannel;
    da_Tcl_OpenFileChannel Tcl_OpenFileChannel;
    da_Tcl_OpenTcpClient Tcl_OpenTcpClient;
    da_Tcl_OpenTcpServer Tcl_OpenTcpServer;
    da_Tcl_OutputBuffered Tcl_OutputBuffered;
    da_Tcl_Panic Tcl_Panic;
    da_Tcl_PanicVA Tcl_PanicVA;
    da_Tcl_ParseArgsObjv Tcl_ParseArgsObjv;
    da_Tcl_ParseBraces Tcl_ParseBraces;
    da_Tcl_ParseCommand Tcl_ParseCommand;
    da_Tcl_ParseExpr Tcl_ParseExpr;
    da_Tcl_ParseQuotedString Tcl_ParseQuotedString;
    da_Tcl_ParseVar Tcl_ParseVar;
    da_Tcl_ParseVarName Tcl_ParseVarName;
    // da_Tcl_PkgInitStubsCheck Tcl_PkgInitStubsCheck;
    da_Tcl_PkgPresent Tcl_PkgPresent;
    da_Tcl_PkgPresentEx Tcl_PkgPresentEx;
    da_Tcl_PkgProvide Tcl_PkgProvide;
    da_Tcl_PkgProvideEx Tcl_PkgProvideEx;
    da_Tcl_PkgRequire Tcl_PkgRequire;
    da_Tcl_PkgRequireEx Tcl_PkgRequireEx;
    da_Tcl_PkgRequireProc Tcl_PkgRequireProc;
    // da_Tcl_PopCallFrame Tcl_PopCallFrame;
    da_Tcl_PosixError Tcl_PosixError;
    da_Tcl_Preserve Tcl_Preserve;
    da_Tcl_PrintDouble Tcl_PrintDouble;
    da_Tcl_ProcObjCmd Tcl_ProcObjCmd;
    // da_Tcl_PushCallFrame Tcl_PushCallFrame;
    da_Tcl_PutEnv Tcl_PutEnv;
    da_Tcl_QueryTimeProc Tcl_QueryTimeProc;
    da_Tcl_QueueEvent Tcl_QueueEvent;
    da_Tcl_Read Tcl_Read;
    da_Tcl_ReadChars Tcl_ReadChars;
    da_Tcl_ReadRaw Tcl_ReadRaw;
    da_Tcl_Realloc Tcl_Realloc;
    da_Tcl_ReapDetachedProcs Tcl_ReapDetachedProcs;
    da_Tcl_RecordAndEval Tcl_RecordAndEval;
    da_Tcl_RecordAndEvalObj Tcl_RecordAndEvalObj;
    da_Tcl_RegExpCompile Tcl_RegExpCompile;
    da_Tcl_RegExpExec Tcl_RegExpExec;
    da_Tcl_RegExpExecObj Tcl_RegExpExecObj;
    da_Tcl_RegExpGetInfo Tcl_RegExpGetInfo;
    da_Tcl_RegExpMatch Tcl_RegExpMatch;
    da_Tcl_RegExpMatchObj Tcl_RegExpMatchObj;
    da_Tcl_RegExpRange Tcl_RegExpRange;
    da_Tcl_RegisterChannel Tcl_RegisterChannel;
    da_Tcl_RegisterConfig Tcl_RegisterConfig;
    da_Tcl_RegisterObjType Tcl_RegisterObjType;
    da_Tcl_Release Tcl_Release;
    // da_Tcl_RemoveInterpResolvers Tcl_RemoveInterpResolvers;
    da_Tcl_ResetResult Tcl_ResetResult;
    da_Tcl_RestoreInterpState Tcl_RestoreInterpState;
    da_Tcl_RestoreResult Tcl_RestoreResult;
    da_Tcl_SaveInterpState Tcl_SaveInterpState;
    da_Tcl_SaveResult Tcl_SaveResult;
    da_Tcl_ScanCountedElement Tcl_ScanCountedElement;
    da_Tcl_ScanElement Tcl_ScanElement;
    da_Tcl_Seek Tcl_Seek;
    da_Tcl_SeekOld Tcl_SeekOld;
    da_Tcl_ServiceAll Tcl_ServiceAll;
    da_Tcl_ServiceEvent Tcl_ServiceEvent;
    da_Tcl_ServiceModeHook Tcl_ServiceModeHook;
    da_Tcl_SetAssocData Tcl_SetAssocData;
    da_Tcl_SetBignumObj Tcl_SetBignumObj;
    da_Tcl_SetBooleanObj Tcl_SetBooleanObj;
    da_Tcl_SetByteArrayLength Tcl_SetByteArrayLength;
    da_Tcl_SetByteArrayObj Tcl_SetByteArrayObj;
    da_Tcl_SetChannelBufferSize Tcl_SetChannelBufferSize;
    da_Tcl_SetChannelError Tcl_SetChannelError;
    da_Tcl_SetChannelErrorInterp Tcl_SetChannelErrorInterp;
    da_Tcl_SetChannelOption Tcl_SetChannelOption;
    da_Tcl_SetCommandInfo Tcl_SetCommandInfo;
    da_Tcl_SetCommandInfoFromToken Tcl_SetCommandInfoFromToken;
    da_Tcl_SetDefaultEncodingDir Tcl_SetDefaultEncodingDir;
    da_Tcl_SetDoubleObj Tcl_SetDoubleObj;
    da_Tcl_SetEncodingSearchPath Tcl_SetEncodingSearchPath;
    da_Tcl_SetEnsembleFlags Tcl_SetEnsembleFlags;
    da_Tcl_SetEnsembleMappingDict Tcl_SetEnsembleMappingDict;
    da_Tcl_SetEnsembleParameterList Tcl_SetEnsembleParameterList;
    da_Tcl_SetEnsembleSubcommandList Tcl_SetEnsembleSubcommandList;
    da_Tcl_SetEnsembleUnknownHandler Tcl_SetEnsembleUnknownHandler;
    da_Tcl_SetErrno Tcl_SetErrno;
    da_Tcl_SetErrorCode Tcl_SetErrorCode;
    da_Tcl_SetErrorCodeVA Tcl_SetErrorCodeVA;
    da_Tcl_SetErrorLine Tcl_SetErrorLine;
    da_Tcl_SetExitProc Tcl_SetExitProc;
    da_Tcl_SetIntObj Tcl_SetIntObj;
    da_Tcl_SetListObj Tcl_SetListObj;
    da_Tcl_SetLongObj Tcl_SetLongObj;
    da_Tcl_SetMainLoop Tcl_SetMainLoop;
    da_Tcl_SetMaxBlockTime Tcl_SetMaxBlockTime;
    // da_Tcl_SetNamespaceResolvers Tcl_SetNamespaceResolvers;
    da_Tcl_SetNamespaceUnknownHandler Tcl_SetNamespaceUnknownHandler;
    da_Tcl_SetNotifier Tcl_SetNotifier;
    da_Tcl_SetObjErrorCode Tcl_SetObjErrorCode;
    da_Tcl_SetObjLength Tcl_SetObjLength;
    da_Tcl_SetObjResult Tcl_SetObjResult;
    da_Tcl_SetPanicProc Tcl_SetPanicProc;
    da_Tcl_SetRecursionLimit Tcl_SetRecursionLimit;
    da_Tcl_SetResult Tcl_SetResult;
    da_Tcl_SetReturnOptions Tcl_SetReturnOptions;
    da_Tcl_SetServiceMode Tcl_SetServiceMode;
    da_Tcl_SetStartupScript Tcl_SetStartupScript;
    da_Tcl_SetStdChannel Tcl_SetStdChannel;
    da_Tcl_SetStringObj Tcl_SetStringObj;
    da_Tcl_SetSystemEncoding Tcl_SetSystemEncoding;
    da_Tcl_SetTimeProc Tcl_SetTimeProc;
    da_Tcl_SetTimer Tcl_SetTimer;
    da_Tcl_SetUnicodeObj Tcl_SetUnicodeObj;
    da_Tcl_SetVar Tcl_SetVar;
    da_Tcl_SetVar2 Tcl_SetVar2;
    da_Tcl_SetVar2Ex Tcl_SetVar2Ex;
    da_Tcl_SetWideIntObj Tcl_SetWideIntObj;
    da_Tcl_SignalId Tcl_SignalId;
    da_Tcl_SignalMsg Tcl_SignalMsg;
    da_Tcl_Sleep Tcl_Sleep;
    da_Tcl_SourceRCFile Tcl_SourceRCFile;
    da_Tcl_SpliceChannel Tcl_SpliceChannel;
    da_Tcl_SplitList Tcl_SplitList;
    da_Tcl_SplitPath Tcl_SplitPath;
    da_Tcl_StackChannel Tcl_StackChannel;
    da_Tcl_Stat Tcl_Stat;
    da_Tcl_StaticPackage Tcl_StaticPackage;
    da_Tcl_StringCaseMatch Tcl_StringCaseMatch;
    da_Tcl_StringMatch Tcl_StringMatch;
    da_Tcl_SubstObj Tcl_SubstObj;
    da_Tcl_TakeBignumFromObj Tcl_TakeBignumFromObj;
    da_Tcl_Tell Tcl_Tell;
    da_Tcl_TellOld Tcl_TellOld;
    da_Tcl_ThreadAlert Tcl_ThreadAlert;
    da_Tcl_ThreadQueueEvent Tcl_ThreadQueueEvent;
    da_Tcl_TraceCommand Tcl_TraceCommand;
    da_Tcl_TraceVar Tcl_TraceVar;
    da_Tcl_TraceVar2 Tcl_TraceVar2;
    da_Tcl_TransferResult Tcl_TransferResult;
    da_Tcl_TranslateFileName Tcl_TranslateFileName;
    da_Tcl_TruncateChannel Tcl_TruncateChannel;
    da_Tcl_Ungets Tcl_Ungets;
    da_Tcl_UniCharAtIndex Tcl_UniCharAtIndex;
    da_Tcl_UniCharCaseMatch Tcl_UniCharCaseMatch;
    da_Tcl_UniCharIsAlnum Tcl_UniCharIsAlnum;
    da_Tcl_UniCharIsAlpha Tcl_UniCharIsAlpha;
    da_Tcl_UniCharIsControl Tcl_UniCharIsControl;
    da_Tcl_UniCharIsDigit Tcl_UniCharIsDigit;
    da_Tcl_UniCharIsGraph Tcl_UniCharIsGraph;
    da_Tcl_UniCharIsLower Tcl_UniCharIsLower;
    da_Tcl_UniCharIsPrint Tcl_UniCharIsPrint;
    da_Tcl_UniCharIsPunct Tcl_UniCharIsPunct;
    da_Tcl_UniCharIsSpace Tcl_UniCharIsSpace;
    da_Tcl_UniCharIsUpper Tcl_UniCharIsUpper;
    da_Tcl_UniCharIsWordChar Tcl_UniCharIsWordChar;
    da_Tcl_UniCharLen Tcl_UniCharLen;
    da_Tcl_UniCharNcasecmp Tcl_UniCharNcasecmp;
    da_Tcl_UniCharNcmp Tcl_UniCharNcmp;
    da_Tcl_UniCharToLower Tcl_UniCharToLower;
    da_Tcl_UniCharToTitle Tcl_UniCharToTitle;
    da_Tcl_UniCharToUpper Tcl_UniCharToUpper;
    da_Tcl_UniCharToUtf Tcl_UniCharToUtf;
    da_Tcl_UniCharToUtfDString Tcl_UniCharToUtfDString;
    da_Tcl_UnlinkVar Tcl_UnlinkVar;
    da_Tcl_UnregisterChannel Tcl_UnregisterChannel;
    da_Tcl_UnsetVar Tcl_UnsetVar;
    da_Tcl_UnsetVar2 Tcl_UnsetVar2;
    da_Tcl_UnstackChannel Tcl_UnstackChannel;
    da_Tcl_UntraceCommand Tcl_UntraceCommand;
    da_Tcl_UntraceVar Tcl_UntraceVar;
    da_Tcl_UntraceVar2 Tcl_UntraceVar2;
    da_Tcl_UpVar Tcl_UpVar;
    da_Tcl_UpVar2 Tcl_UpVar2;
    da_Tcl_UpdateLinkedVar Tcl_UpdateLinkedVar;
    da_Tcl_UtfAtIndex Tcl_UtfAtIndex;
    da_Tcl_UtfBackslash Tcl_UtfBackslash;
    da_Tcl_UtfCharComplete Tcl_UtfCharComplete;
    da_Tcl_UtfFindFirst Tcl_UtfFindFirst;
    da_Tcl_UtfFindLast Tcl_UtfFindLast;
    da_Tcl_UtfNcasecmp Tcl_UtfNcasecmp;
    da_Tcl_UtfNcmp Tcl_UtfNcmp;
    da_Tcl_UtfNext Tcl_UtfNext;
    da_Tcl_UtfPrev Tcl_UtfPrev;
    da_Tcl_UtfToExternal Tcl_UtfToExternal;
    da_Tcl_UtfToExternalDString Tcl_UtfToExternalDString;
    da_Tcl_UtfToLower Tcl_UtfToLower;
    da_Tcl_UtfToTitle Tcl_UtfToTitle;
    da_Tcl_UtfToUniChar Tcl_UtfToUniChar;
    da_Tcl_UtfToUniCharDString Tcl_UtfToUniCharDString;
    da_Tcl_UtfToUpper Tcl_UtfToUpper;
    da_Tcl_ValidateAllMemory Tcl_ValidateAllMemory;
    da_Tcl_VarEval Tcl_VarEval;
    da_Tcl_VarEvalVA Tcl_VarEvalVA;
    da_Tcl_VarTraceInfo Tcl_VarTraceInfo;
    da_Tcl_VarTraceInfo2 Tcl_VarTraceInfo2;
    da_Tcl_WaitForEvent Tcl_WaitForEvent;
    da_Tcl_WaitPid Tcl_WaitPid;
    // da_Tcl_WinTCharToUtf Tcl_WinTCharToUtf;
    // da_Tcl_WinUtfToTChar Tcl_WinUtfToTChar;
    da_Tcl_Write Tcl_Write;
    da_Tcl_WriteChars Tcl_WriteChars;
    da_Tcl_WriteObj Tcl_WriteObj;
    da_Tcl_WriteRaw Tcl_WriteRaw;
    da_Tcl_WrongNumArgs Tcl_WrongNumArgs;
    da_Tcl_ZlibAdler32 Tcl_ZlibAdler32;
    da_Tcl_ZlibCRC32 Tcl_ZlibCRC32;
    da_Tcl_ZlibDeflate Tcl_ZlibDeflate;
    da_Tcl_ZlibInflate Tcl_ZlibInflate;
    da_Tcl_ZlibStreamChecksum Tcl_ZlibStreamChecksum;
    da_Tcl_ZlibStreamClose Tcl_ZlibStreamClose;
    da_Tcl_ZlibStreamEof Tcl_ZlibStreamEof;
    da_Tcl_ZlibStreamGet Tcl_ZlibStreamGet;
    da_Tcl_ZlibStreamGetCommandName Tcl_ZlibStreamGetCommandName;
    da_Tcl_ZlibStreamInit Tcl_ZlibStreamInit;
    da_Tcl_ZlibStreamPut Tcl_ZlibStreamPut;
    da_Tcl_ZlibStreamReset Tcl_ZlibStreamReset;
    da_Tcl_ZlibStreamSetCompressionDictionary Tcl_ZlibStreamSetCompressionDictionary;

    da_TclFreeObj TclFreeObj;
}


//==============================================================================
//
// MACROS
//
//==============================================================================
extern(C) @nogc nothrow
{
    void Tcl_IncrRefCount(Tcl_Obj* obj) { ++obj.refCount; }
    void Tcl_DecrRefCount(Tcl_Obj* obj)
    { if (--obj.refCount <= 0) TclFreeObj(obj); }
    int Tcl_IsShared(Tcl_Obj* obj) { return 1 < obj.refCount ? 1 : 0; }
}
