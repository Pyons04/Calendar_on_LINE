require 'line/bot'
require "date"

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