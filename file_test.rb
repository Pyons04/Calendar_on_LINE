  def today(fix_arry)
#ファイルの読み込み
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
     require 'active_support'
     require "Date"
     require "rails"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     today=Date.today.to_s
     tomorrow=Date.tomorrow.to_s

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

     send=[]

     send.push(s.select{|item| item.include? (tomorrow)})
     send.push(s.select{|item| item.include? (daysafter2)})
     send.push(s.select{|item| item.include? (daysafter3)})
     send.push(s.select{|item| item.include? (daysafter4)})
     send.push(s.select{|item| item.include? (daysafter5)})
     send.push(s.select{|item| item.include? (daysafter6)})
     send.push(s.select{|item| item.include? (daysafter7)})

     @fix_arry=send.join("\n")#配列オブジェクトを改行を入れて文字列に変換
   end

        @fix_arry=""
        week(@fix_arry)
        text=@fix_arry
        puts text