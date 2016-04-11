# Dtcl/Dtk dynamic binding library of Tcl/Tk, for D.


__Version:__ UC(dmd2.071.0)

__Date:__ 2016-Apr-11 22:46:28

__Authors:__ KUMA


## はじめにお読み下さい:
これはD言語からTcl/Tkを利用する為のプログラムです。
本項にはTcl/Tk本体は付属しません。別途入手して下さい。


## 初めての方へ:
[tkd(https://github.com/nomad-software/tkd)](https://github.com/nomad-software/tkd)をご利用ください。


## 謝辞:
- D言語で記述されています。
  [Digital Mars D Programming Language(http://dlang.org/)](http://dlang.org/)
- Windows版の開発にActiveTclを参照しています。
  デモプログラムはActiveTclに添付のものから移植しました。
  [ActiveState(http://www.activestate.com/tcl)](http://www.activestate.com/tcl)



## 使い方:
```d
import dtk;
void main() { startTk("Hello, Tk", (tk){ with (tk)
{
    grid(ttk.button(".b").text("Hello World")).call;
}});}

```


## 特徴:
- [tkd(https://github.com/nomad-software/tkd)](https://github.com/nomad-software/tkd)は、
  「tkinterみたいな使い勝手」でした。
  本ライブラリは「tclみたいな使い勝手」になっています。
- DLLの遅延読み込みを行います。



## 開発環境:
現在は、Windows Vista x64 と ActiveTclのDLL でのみ確認をしています。


## 今後の方針:
- README 英語版作る。
- dtcl.utilとdtk.utilをもっとちゃんとする。
- linux対応
- よりD言語っぽく書けるようなインターフェイスにしたい。



## 履歴:
- 2016-04-11 ver.UC(dmd2.071.0) 動いた。



