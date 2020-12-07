#webrickを呼び出す
require 'webrick'
#.newメゾットでWebrickのインスタンスを作成し、それをローカル変数serverに代入
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
#webサーバーを起動した状態で、(DocumentRootの値) /testというURLを送信すると同じディレクトリ階層にある
#ファイルを表示する機能
server.mount('/',WEBrick::HTTPServlet::ERBHandler, 'new.html.erb')
server.mount('/data_one.cgi', WEBrick::HTTPServlet::CGIHandler, 'data_one.rb')
server.mount('/data_two.cgi', WEBrick::HTTPServlet::CGIHandler, 'data_two.rb')
server.start
