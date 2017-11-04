require 'line/bot'
require "date"

t = Time.now
strTime = t.strftime("%H:%M").to_s

if strTime=="06:00"||strTime=="06:01"


     s = []
     require "pg"
     # データベース接続する
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => ENV["DB_PASSWORD"], :dbname => ENV["DB_NAME"],:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish
     #データベースの内容を配列に収納
     result.each do |record|
     s<<record['content']
     end
     today=Date.today.to_s
     puts("Today is "+today)
     s=s.select{|item| item.include? (today)}
     if s.join()==""
      fix_arry="No task today"
     elsif
      send=s.join()
      fix_arry=send
     end


    message = {
      type: 'text',
      text: "Good Morning! This is today's schedule. \n#{fix_arry}\n Have a nice day!"
    }

    puts message

    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    response = client.push_message(ENV["Your_user_id"], message)
    p response
    puts 'Puse process has been finished.'

else

     s = []
     require "pg"
     # データベース接続する
      connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => ENV["DB_PASSWORD"], :dbname => ENV["DB_NAME"],:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish
     #データベースの内容を配列に収納
     result.each do |record|
     s<<record['content']
     end

     puts("All contents")
     puts s.join()
     puts("All contents end")


     today=Date.today.to_s
     puts("\n\nToday is "+today)
     s=s.select{|item| item.include? (today)}

     puts("\n\nToday's contents")
     puts s.join()
     puts("Today's contetns end")

     t = Time.now
     strTime = t.strftime("%H:%M").to_s


     send=[]
     strTime = "!#{strTime}"
     puts ("\n\nI will find  #{strTime} from the array.")
     send=s.select{|item| item.include?(strTime)}


     if send.join()==""
     #heroku may start later than the time I registered.
     t = Time.now-Rational(1, 24 * 60)
     strTime_error =t.strftime("%H:%M").to_s
     send=s.select{|item| item.include?(strTime)}
     else
     puts ("\n\nIt seems capture contunts sucsessful just on time!!")
     end


     puts("\n\nPush Contents")
     puts send.join()
     puts("Push contents end")


     if send.join()==""
        puts"\n\nNo Tsak has been registered. The process has been finished."


     elsif
      send=send.join("\n")
      send="Reminder!\n#{send}"
      fix_arry=send
      message = {
      type: 'text',
      text: "#{fix_arry}"
    }

    puts ("\n\nSend this message to LINE. \n#{message}")

    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    response = client.push_message(ENV["Your_user_id"], message)
    puts ("\n\n#{response}")
    puts "\n\nPuse process has been finished."
     end
end