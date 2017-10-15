def read_file(para_data)
  @paraData=File.open("notebook.txt").readlines
end

def add_content


end




require 'sinatra'
require 'line/bot'
require 'pry'

# 微小変更部分！確認用。
get '/' do
  "Hello world"
end

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end


  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text 

        case event.message['text']

        when 'Today' then
        @para_Data=[]  #空の配列を作成
        read_file(@para_data)  #配列を引数として渡す
        @paraData.each do |data|
        puts(data)
        end
        message = {type: 'text',text:@paradata}
        client.reply_message(event['replyToken'], message)


        when 'Tomorrow' then
        text="明日の予定はありません。"
        message = {type: 'text',text:text}
        client.reply_message(event['replyToken'], message)
        end


      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end