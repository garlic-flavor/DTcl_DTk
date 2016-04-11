/**
 * Date:       2016-Mar-19 16:02:06
 * Authors:    KUMA
 * License:    CC0
*/
module sworks.base.malloc;

//------------------------------------------------------------------------------
// メモリ関連
//------------------------------------------------------------------------------
/** Win32 側にポインタを渡す場合は GC で確保したメモリをそのまま渡しちゃだめ。
 * mallocInstance で確保されたポインタは不動。
 * そのかわり freeInstance を実行する必要がある。
 */
auto mallocInstance(T, ARGS...)(ARGS args)
    if (is(T == class) || is(T == struct))
{
    import core.stdc.stdlib : malloc;
    import std.conv : emplace;
    import core.memory: GC;
    static if      (is(T == class)) enum L = __traits(classInstanceSize, T);
    else static if (is(T == struct)) enum L = T.sizeof;
    auto t = malloc(L);
    GC.addRange(t, L);
    return t[0..L].emplace!T(args);
}

///
void freeInstance(T)(T obj)
{
    import core.stdc.stdlib : free;
    import core.memory : GC;
    if (obj is null) return;
    destroy(obj);
    GC.removeRange(cast(void*)obj);
    free(cast(void*)obj);
}
