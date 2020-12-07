#データを受け取り、返却するcgiプログラムの起動
require 'cgi'
#newメゾットでインスタンス化したものを変数cgiに代入
cgi = CGI.new
#データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"data_one"のデータを cgi['data_one']と言う記述で取り出し、ローカル変数get_oneに代入する
  get_one = cgi['goya']
  #HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>自家消費以外のゴーヤの大きさと売った相手の情報は下記になります</p>
      文字列：#{get_one}
    </body>
  </html>"
}
