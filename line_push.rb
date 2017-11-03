require 'line/bot'
require "date"

t = Time.now
strTime = t.strftime("%H:%M").to_s
puts strTime

if strTime=="06:00"


     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
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
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     today=Date.today.to_s
     puts("Today is "+today)
     s=s.select{|item| item.include? (today)}

     t = Time.now
     strTime = t.strftime("%H:%M").to_s
     strTime = "!#{strTime}"
     puts strTime
     s=s.select{|item| item.include?(strTime)}
     if s.join()==""
        puts"No Tsak has been registerd."
     elsif
      send=s.join()
      send="Reminder!\n#{send}"
      fix_arry=send
      message = {
      type: 'text',
      text: "#{fix_arry}"
    }

    puts message

    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    response = client.push_message(ENV["Your_user_id"], message)
    p response
    puts 'Puse process has been finished.'
     end




end