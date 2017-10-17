

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

   def today(fix_arry)
     require "date"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     today=Date.today.to_s
     puts("今日の日付は"+today)
     s=s.select{|item| item.include? (today)}
     @fix_arry=s.join("\n")#配列オブジェクトを改行を入れて文字列に変換
   end


   def tomorrow(fix_arry)
     require "rails"
     require "date"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     tomorrow=Date.tomorrow.to_s
     puts("明日の日付は"+tomorrow)
     s=s.select{|item| item.include? (tomorrow)}
     @fix_arry=s.join("\n")#配列オブジェクトを改行を入れて文字列に変換
   end


   def week(fix_arry)
     require "rails"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     puts s.to_s
     today=Date.today.to_s
     tomorrow=Date.tomorrow.to_s

     puts today
     now = Date.today
     daysafter2 = now + 2.days
     daysafter3 = now + 3.days
     daysafter4 = now + 4.days
     daysafter5 = now + 5.days
     daysafter6 = now + 6.days
     daysafter7 = now + 7.days

     daysafter2=daysafter2.to_s
     daysafter3=daysafter3.to_s
     daysafter4=daysafter4.to_s
     daysafter5=daysafter5.to_s
     daysafter6=daysafter6.to_s
     daysafter7=daysafter7.to_s

     puts daysafter2

     send=[]

     send.push(s.select{|item| item.include? (today)})
     send.push(s.select{|item| item.include? (tomorrow)})
     send.push(s.select{|item| item.include? (daysafter2)})
     send.push(s.select{|item| item.include? (daysafter3)})
     send.push(s.select{|item| item.include? (daysafter4)})
     send.push(s.select{|item| item.include? (daysafter5)})
     send.push(s.select{|item| item.include? (daysafter6)})
     send.push(s.select{|item| item.include? (daysafter7)})

     @fix_arry=send
   end


    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text



        case event.message['text']

        when 'Today' then
        @fix_arry=""
        today(@fix_arry)
        text=@fix_arry
        puts text
        message = {type: 'text',text:text}
        client.reply_message(event['replyToken'], message)


        when 'Tomorrow' then
        tomorrow(@fix_arry)
        text=@fix_arry
        puts text
        message = {type: 'text',text:text}
        client.reply_message(event['replyToken'], message)

        when 'Week' then
        week(@fix_arry)
        text=@fix_arry
        puts text
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