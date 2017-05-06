## 並行処理ポイント  
* 再帰でアプリをループ。処理完了にてループから抜ける
* send/receiveにて、1クライアントと複数サーバのやりとり
* クライアントが常に口を開けており、サーバの処理完了したら、クライアントへリクエストを送る。  

## 処理概要
### クライアント
- run
  - 並行処理のための準備を行う関数。
  - 複数のサーバプロセスを生成後に、１つのクライアントプロセスを呼び出す
  - 残処理待ちのqueueを管理

- schedule_process
  - 並行処理用のクライアントプロセス。サーバ側とは異なり１つプロセス。
  - 頭でreceiveして、常にサーバからの結果を待つ。

### サーバ
- fib
  - 並行処理用のサーバプロセス。複数プロセス。
  - 頭でsendして、常にサーバへリクエストを送る

## フロー概要  
### Server
1. send to client（:ready)
2. receive  
  (1) :question  
  処理開始  
  send to client (:answer)  
  再帰  
  (2) :shutdown  
  exit  

### Client
1. Receive  
(1)  
  (a)receive from server (:ready)かつ処理待ちの残queueがある場合  
    send to server (:question)   
    再帰  
  (b)receive from server (:ready)かつ処理待ちの残queueがない場合  
    send to server (:shutdown)   
    再帰  
(2)receive from server (:answer)  
  再帰  
