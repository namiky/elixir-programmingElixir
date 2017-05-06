Elixir プログラミング
======

Elixirt プログラミングの学習記録メモ

### 第1章  赤いカプセルをとれ
* プログラミングとはデータ変換をするためのもの

##  第I部 　伝統的なプログラミング

### 第2章  パターンマッチ
* パターンマッチ
 * "="は代入ではなく、パターンマッチ。そのあとに代入。
* ピン演算子
 * 代入せずにパターンマッチのみをしたいときに使用

### 第3章  不変性
* 不変性
 * Elixirではデータは常に不変。変更は新規にデータをコピーして再作成で実現。

### 第4章  Elixirの基礎
* タプル
 - `{1,:AAA,"test"}`
* リスト
 - `[1,2,3]`
* キーワードリスト
 * `[1 , AAA: "test", BBB: "apple"]  `
 * =`[1 , {:AAA, "test"} , {:BBB,"apple"}]`
 * リストの要素に「１要素目がアトムによるKey、２要素目がvalue」なタプルを持つ。
 * ショートカットの記法あり
* マップ
 * `%{"one"=>1, :two =>2,"theree"=>3}`
 * =`%{"one"=>1, two: 2, "theree"=>3`
 * `map[one]` >>1 
 * `map.two` >>1  # atomのときに可能
 * key/valueの２要素を持つコレクション。
 * Keyにアトム以外も指定できる。
 * ショートカットが使用可能
* with
 * 

### 第5章  無名関数
* `fn ... end`
  * `fn (a,b) ->a+b end`
* &記法 
  * = `fn &(&1+&2) end`

### 第6章  モジュールと名前付き関数45
* defmodule
 * モジュール
* def
 * 名前付き関数
 * defを呼び出す際の引数とdef引数でパターンマッチを行う。
* ガード節
 * when011
* デフォルトパラメータ
 * パラメータ \\ デフォルトパラメータ
* プライベート関数
 * defp
* パイプライン
 * |>
 * 前処理の戻り値をパイプライン先の関数の第１引数に挿入
* メタデータ
 * @metadate
 * 変数ではない。定数、またはメタデータとして扱う。

### 第7章  リストと再帰
リストを用いた再帰のデザイン
* リスト
* 再帰
### 第8章  マップ、キーワードリスト、セット、構造体
* 構造体
* defstruct  
* %structure_name{}  
マップの構造を明示的に示しておくために使用するモジュール。

### 第9章  寄り道：型とは何か？
### 第10章 コレクションの処理―――Enum とStream
* Enum  
コレクションの操作を行うためのモジュール
* Stream  
遅延列挙。パイプラインなどでコレクションに対して複数の処理を行う際にEnumだと処理途中のコレクションをいちいち作成してしまう。Streamを用いると中間リストを作成せずに、最終的なデータ変換後のリストのみを取得できる。
* 内包表記(comprehension)  
コレクションに対する処理コードを短縮したもの。  
`result = for x,y <-[1,2],[3,4] ,do: x*y`  
>`[3,4,6,8]`


### 第11章 文字列とバイナリ
* ヒアドキュメント
* シジル
### 第12章 制御フロー
* if
* unless
* cond  
複数のelseif  
cond do  
true -> ":ok"    
false -> ":error"  
end  


* case

### 第13章 プロジェクトを構成する
* mix


## 第II部 並行プログラミング
### 第14章 複数のプロセスを使う
* pid
* send/receive
* spawn
* spawn_link  
  子プロセス死亡時に親も道連れ
* spawn_monitor
* 演習：フィボナッチサーバ

### 第15章 ノード―――分散システムの要
* ノード
* iex --sname node_name
* クッキー
* セキュリティ

### 第16章 OTP：サーバ
### 第17章 OTP：スーパーバイザ
### 第18章 OTP：アプリケーション
### 第19章 タスクとエージェント

## 第III部 より高度なElixir1
### 第20章 マクロとコードの評価
### 第21章 モジュールのリンク: ビヘイビアとuse
### 第22章 プロトコル―――ポリモーフィック関数
### 第23章 かっこいい機能いろいろ

## 付録
### 付録A 例外：raise、try、catch、throw
### 付録B 型仕様と型チェック
### 付録C 参考文献
### 付録D 日本語版に寄せて

======
## How to run　（　Elixir実行方法）  

1. Terminal with iex  
Terminal のiex(Interactive Elixir)を用いる方法
 > iex -S mix  
 > ...cmd line elixir running  
 > MODULE.FUNCTION  
 > ...実行結果  

2. スクリプトの実行
module.exsを作成して、elixirでプログラミング
> elixir module.exs  
> ...実行結果  

3. Use mix
mix(プロジェクト管理ツール)でプロジェクトを作成・実行する方法
> mix run -e <<MODULE NAME>>  
> ..実行結果

3. WAY3.escript <<APPLICATION>>  
(1) 設定  
下記を追記  
> escript: escript,  

下記を追記  
>  def escript do  
>  [main_module: MODULE.FUNCTION]  
>  end  

(2) コンパイル＆実行  
> mix escirpt.build  
> escript xxxx  
> ...実行結果   
