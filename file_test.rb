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

   def month(fix_arry)
     require "rails"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }

     number=1
     send=[]
     while number<32 do
     now = Date.today
     daysafter = now + number.days
     daysafter=daysafter.to_s
     send.push(s.select{|item| item.include? (daysafter)})
     number=number+1
     end
     @fix_arry=send.join
   end


def week(fix_arry)
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
     send.push(s.select{|item| item.include? (today)})
     send.push(s.select{|item| item.include? (tomorrow)})
     send.push(s.select{|item| item.include? (daysafter2)})
     send.push(s.select{|item| item.include? (daysafter3)})
     send.push(s.select{|item| item.include? (daysafter4)})
     send.push(s.select{|item| item.include? (daysafter5)})
     send.push(s.select{|item| item.include? (daysafter6)})
     send.push(s.select{|item| item.include? (daysafter7)})

     @fix_arry=send#配列オブジェクトを改行を入れて文字列に変換
   end

def add_todo(content)
     #最も大きいリストの管理番号を入手しそれより一つ大きい管理番号を発行する。
     require "rails"
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     last_management_number=s.last.to_s
     puts(last_management_number)
     re = Regexp.new('\[.+?\]')
     last_management_number = re.match(last_management_number).to_s
     last_management_number=last_management_number.delete('[').delete(']').to_i
     new_management_number=last_management_number+1
    #最も大きいリストの管理番号を入手しそれより一つ大きい管理番号を発行する。終わり。

    puts new_management_number
    content=content.chomp
    content=content.delete('Add')
    File.open("notebook.txt","a") do |notebook|
    notebook.puts("["+new_management_number.to_s+"]"+content)
  end
    return(content).delete('Add')
  end

def delete(number)


end

        @fix_arry=""
        puts ("コマンドを入力してください")
        command=gets.to_s
        content=command
        add_todo(content)

