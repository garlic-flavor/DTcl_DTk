::msgcat::mcset ja "Widget Demonstration" "Tcl/Tkの紹介"
::msgcat::mcset ja "tkWidgetDemo"
::msgcat::mcset ja "&File" "ファイル(&F)"
::msgcat::mcset ja "About..." "情報"
::msgcat::mcset ja "&About..." "情報(&A)"
::msgcat::mcset ja "<F1>"
::msgcat::mcset ja "&Quit" "閉じる(&Q)"
::msgcat::mcset ja "Meta+Q"		;# Displayed hotkey
::msgcat::mcset ja "Meta-q"		;# Actual binding sequjace
::msgcat::mcset ja "Ctrl+Q"		;# Displayed hotkey
::msgcat::mcset ja "Control-q"		;# Actual binding sequence
::msgcat::mcset ja "Variable values" "変数"
::msgcat::mcset ja "Variable values:" "変数:"
::msgcat::mcset ja "OK" "確認"
::msgcat::mcset ja "Run the \"%s\" sample program" "サンプルプログラム \"%s\" を実行する。"
::msgcat::mcset ja "See Code" "ソースを見る"
::msgcat::mcset ja "Dismiss" "戻る"
::msgcat::mcset ja "Rerun Demo" "デモを実行する"
::msgcat::mcset ja "Demo code: %s" "デモコード: %s"
::msgcat::mcset ja "About Widget Demo" "このプログラムに関して"
::msgcat::mcset ja "Tk widget demonstration application" "Tk紹介用プログラム"
::msgcat::mcset ja "Copyright \u00a9 %s"
::msgcat::mcset ja "
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
" "
    @@title Tk紹介用プログラム
    @@normal
    @@newline

    このアプリケーションは、Tk紹介用スクリプトの起点となります。
    以下のリンクをクリックするとそれぞれの機能を紹介するスクリプトを実行で
    きます。スクリプト内では、
    @@bold
    ソースを見る
    @@normal
    ボタンからスクリプトのソースコードを見ることができます。
    (不完全な実装です。)
    スクリプト表示ウィンドウ内の
    @@bold
    デモを実行する
    @@normal
    ボタンで編集したスクリプトを実行します。(実装されていません。)
    @@newline
"
::msgcat::mcset ja "Labels, buttons, checkbuttons, and radiobuttons" "ラベル、ボタン、チェックボタン、ラジオボタンに関して。"
::msgcat::mcset ja "Labels (text and bitmaps)" "ラベル(文字と画像)"
::msgcat::mcset ja "Labels and UNICODE text" "ラベル(多言語文字列)"
::msgcat::mcset ja "Buttons" "ボタン"
::msgcat::mcset ja "Check-buttons (select any of a group)" "チェックボタン(複数選択)"
::msgcat::mcset ja "Radio-buttons (select one of a group)" "ラジオボタン(排他選択)"
::msgcat::mcset ja "A 15-puzzle game made out of buttons" "ボタンを使った「15-パズル」"
::msgcat::mcset ja "Iconic buttons that use bitmaps" "アイコン付きボタン"
::msgcat::mcset ja "Two labels displaying images" "画像を表示する為の2種類のボタン"
::msgcat::mcset ja "A simple user interface for viewing images" "画像表示機能"
::msgcat::mcset ja "Labelled frames" "ラベル付き枠"
::msgcat::mcset ja "Listboxes" "リストボックス"
::msgcat::mcset ja "The 50 states" "50州"
::msgcat::mcset ja "Colors: change the color scheme for the application" "色: アプリケーションの色設定の変更"
::msgcat::mcset ja "A collection of famous and infamous sayings"
::msgcat::mcset ja "Entries and Spin-boxes"
::msgcat::mcset ja "Entries without scrollbars"
::msgcat::mcset ja "Entries with scrollbars"
::msgcat::mcset ja "Validated entries and password fields"
::msgcat::mcset ja "Spin-boxes"
::msgcat::mcset ja "Simple Rolodex-like form"
::msgcat::mcset ja "Text"
::msgcat::mcset ja "Basic editable text"
::msgcat::mcset ja "Text display styles"
::msgcat::mcset ja "Hypertext (tag bindings)"
::msgcat::mcset ja "A text widget with embedded windows"
::msgcat::mcset ja "A search tool built with a text widget"
::msgcat::mcset ja "Canvases"
::msgcat::mcset ja "The canvas item types"
::msgcat::mcset ja "A simple 2-D plot"
::msgcat::mcset ja "Text items in canvases"
::msgcat::mcset ja "An editor for arrowheads on canvas lines"
::msgcat::mcset ja "A ruler with adjustable tab stops"
::msgcat::mcset ja "A building floor plan"
::msgcat::mcset ja "A simple scrollable canvas"
::msgcat::mcset ja "Scales"
::msgcat::mcset ja "Horizontal scale"
::msgcat::mcset ja "Vertical scale"
::msgcat::mcset ja "Paned Windows"
::msgcat::mcset ja "Horizontal paned window"
::msgcat::mcset ja "Vertical paned window"
::msgcat::mcset ja "Menus"
::msgcat::mcset ja "Menus and cascades (sub-menus)"
::msgcat::mcset ja "Menu-buttons"
::msgcat::mcset ja "Common Dialogs"
::msgcat::mcset ja "Message boxes"
::msgcat::mcset ja "File selection dialog"
::msgcat::mcset ja "Color picker"
::msgcat::mcset ja "Miscellaneous"
::msgcat::mcset ja "The built-in bitmaps"
::msgcat::mcset ja "A dialog box with a local grab"
::msgcat::mcset ja "A dialog box with a global grab"

## label
::msgcat::mcset ja "Five labels are displayed below: three textual ones on the left, and an image label and a text label on the right.  Labels are pretty boring because you can't do anything with them." "5種類のラベルが以下に示されます。左側の3つは文字によるラベルです。右側に画像とそのタイトルのラベルがあります。ラベルはユーザーからの入力を受け付けません。"
::msgcat::mcset ja "First label" "第1のラベル"
::msgcat::mcset ja "Second label, raised" "第2のラベル、飛び出ています。"
::msgcat::mcset ja "Third label, sunken" "第3のラベル、凹んでいます。"
::msgcat::mcset ja "Tcl/Tk Creator" "Tcl/Tkの著者近影"

