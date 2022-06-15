 # KARALIS  〜カラオケリスト〜
 
 ## サービス概要
 
 カラオケで一緒にいるメンバーが普段どんな曲を聴くのかわからないため、気を使って有名な曲しか選曲できない人に  
あらかじめカラオケに行くメンバーでグループを作り、好きな曲を共有できるサービスです

## URL
https://www.playlist-karalis.com/

## 開発環境

- Ruby 2.7.6
- Ruby on Rails 6.1.6
- mysql 8.0.28

## メインのターゲットユーザー

- 付き合いでカラオケに行くことが多い人
- アニソンやボカロなど趣味を周りと共有したい人

## ユーザーが抱える課題

- 周りの好みが分からないので有名な曲を選曲してしまい、ボカロなど相手が知らないかもしれない曲を選曲できない
- 一緒にカラオケに行く人の曲の好みを知りたい

## 解決方法

一緒にカラオケに行くメンバーでグループを作成し、好きな曲リストを共有します。

好きな曲リストの中身は

- 曲のタイトル
- アーティスト
- リスト追加日


・ グループに招待するのはLINEのトークにURLを飛ばし、そこからグループに参加できるようにしようと思います。  

## 実装予定の機能

MVP時点での機能
- 曲名を打ち込み、リストを作成
- グループを作成し、作成したリストの中から共有するものを選択し、共有
- LINEを使ってグループに招待
- 共有したい曲の表示・非表示機能

リリース時の機能
- 曲名を検索でき、リストを作成・追加
- グループを作成し、作成したリストの中から共有するものを選択し、共有
- 共有したい曲の表示・非表示機能

## なぜこのサービスを作りたいのか？

部活や仕事の先輩や後輩、新しい友人や合コンなどでカラオケに行くとどんな曲が好きなのか知らないため、「極力有名な曲を歌わなければ盛り上がらない」と気を使ってしまいます。  
なのであらかじめ一緒に行くメンバーの好きな曲が事前に把握できれば選曲をする際に参考になるのではと思い、このサービスを作ろうと思いました。  
まだ親しくなっていない人と **「好きを共有する」** ことができ、コミュニケーションを取るきっかけになればと思いました。

## スケジュール

README〜ER図作成 : 3/25 〆切  
メイン機能実装 : 3/25〜5/26 
β版をRUNTEQ内リリース(MVP) : 5/27 〆切  
本番リリース : 6月15日
 
## 画面遷移図

https://www.figma.com/file/sA4mDfDNVGTelE5aYOK7V9/KARALIS%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1

## ER図
https://drive.google.com/file/d/1V5Z9oEObnO-8dXtsp-iB-VgP986EbSdH/view?usp=sharing
