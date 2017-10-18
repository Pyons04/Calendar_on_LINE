require 'line/bot'

require "date"
s = []
File.open("notebook.txt", mode = "rt"){|f|
s = f.readlines
}

today=Date.today.to_s
s=s.select{|item| item.include? (today)}
contents=("今日の予定です。"+s.join("\n")+"以上です")
#配列オブジェクトを改行を入れて文字列に変換
puts contents

message = {
  type: 'text',
  text: contents
}
client = Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
}
response = client.push_message("1539952827", message)
p response
