
    def delete(number)
#すべての予定（配列）をnotebookから配列に追加
     require "rails"
     require "pry"
     s = []
     require "pg"
     # データベース接続する
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => "5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish
     #データベースの内容を配列に収納
     result.each do |record|
     s<<record['content']
     end
#指定した番号のレコードだけ配列から削除
     number=number.delete("Delete")
     number=number.gsub(" ", "")
     number=number.chomp
     target=("["+number+"]")
     target=target.chomp
#指定された番号のレコードが存在しない場合の条件処理
     confirm=[]
     confirm=s.select{|item| item.include? (target)}
     binding.pry
  if confirm.empty? then
     number="削除に失敗しました。"
     return(number)
  else
     s=s.reject!{|e|e.include?(target)}
     #全てのレコードを削除を削除
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => "5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("DELETE FROM notebook")
     connection.finish
     #削除済みの配列をデータにして一つ一つデータベースに書き込みなおす。
      s.each do |todo|
       connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => "5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
      result = connection.exec("INSERT INTO notebook(content) VALUES('#{todo}')")
      connection.finish
     end
    number="削除に成功しました。"
    return(number)
  end
end

   def today(fix_arry)
#ファイルの読み込み
  require "date"
      require "pg"
# データベース接続する
   connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password => "5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
  result = connection.exec("SELECT * FROM notebook")
  # データベースへのコネクションを切断する
  connection.finish

  s=[]

  result.each do |record|
    s<<record['content']
  end
     today=Date.today.to_s
     puts("今日の日付は"+today)
     s=s.select{|item| item.include? (today)}
     if s.join()==""
      @fix_arry="表示するコンテンツがありません"
     elsif
      send=s.join()
      @fix_arry=send#配列オブジェクトを改行を入れて文字列に変換
     end
end

def tomorrow(fix_arry)
     require "rails"
     require "date"
     s = []
     require "pg"
     # データベース接続する
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password =>"5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish

     result.each do |record|
     s<<record['content']
     end
     tomorrow=Date.tomorrow.to_s
     puts("明日の日付は"+tomorrow)
     s=s.select{|item| item.include? (tomorrow)}
     if s.join()==""
      @fix_arry="表示するコンテンツがありません"
     elsif
      send=s.join()
      @fix_arry=send#配列オブジェクトを改行を入れて文字列に変換
     end
   end

  def month(fix_arry)
     require "rails"
     s = []
     require "pg"
     # データベース接続する
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password =>"5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish

     result.each do |record|
     s<<record['content']
     end

     number=0
     send=[]
     while number<32 do
     now = Date.today
     daysafter = now + number.days
     daysafter=daysafter.to_s
     send.push(s.select{|item| item.include? (daysafter)})
     number=number+1
     end
     if send.join()=="" #配列の中身が全て空で文字列に変換したとき表示させるものがない場合。
      @fix_arry="表示するコンテンツがありません"
     elsif
      send=send.join()
      @fix_arry=send#配列オブジェクトを改行を入れて文字列に変換
     end
   end

 def week(fix_arry)
     require "rails"
     require "pry"
     s = []
     require "pg"
     # データベース接続する
      connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password =>"5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish

     result.each do |record|
     s<<record['content']
     end
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
     if send.join()==""
      @fix_arry="表示するコンテンツがありません"
     elsif
      send=send.join()
      @fix_arry=send#配列オブジェクトを改行を入れて文字列に変換
     end
   end

   def add_todo(content)
    #ファイルが空だった場合最初の番号を振る（未実装）
    #記入された日付の曜日を取得する（未実装）
    #来週の月曜日、次の金曜日といった、あいまいなワードのとき正確な日付を把握する
    #最も大きいリストの管理番号を入手しそれより一つ大きい管理番号を発行する。
     require "rails"
     s = []
     require "pg"
     # データベース接続する
     connection = PG::connect(:host => "ec2-54-235-213-202.compute-1.amazonaws.com", :user => "unjxvubkqdzxha", :password =>"5c8352099c57e4ccce0511961f978b4df48decc7bd104d16386178537ab715b8", :dbname => "d2m0jpbel3clgh",:port=>"5432")
     result = connection.exec("SELECT * FROM notebook")
     # データベースへのコネクションを切断する
     connection.finish

     result.each do |record|
     s<<record['content']
     end
     
     numbers=[]

     s.each do |records|
     last_management_number=records.to_s
     re = Regexp.new('\[.+?\]')
     last_management_number = re.match(last_management_number).to_s
     last_management_number=last_management_number.delete('[').delete(']').to_i
     numbers<<last_management_number
     end

     last_management_number=numbers.max
     new_management_number=last_management_number+1
    #最も大きいリストの管理番号を入手しそれより一つ大きい管理番号を発行する。終わり。

    puts new_management_number
    content=content.chomp
    content=content.delete('Add')
    record_insert=("["+new_management_number.to_s+"]"+content)

    puts record_insert.to_s

   
    result = connection.exec("INSERT INTO notebook(content) VALUES('#{record_insert}')")
     # データベースへのコネクションを切断する
     connection.finish
     return(content).delete('Add')
  end

puts "コマンドを入力してください。".chomp
message=gets.to_s.chomp

         if message=="Today"
         @fix_arry=""
         today(@fix_arry)
         text=@fix_arry
         puts text

         elsif message=="Tomorrow"
         tomorrow(@fix_arry)
         text=@fix_arry
         puts text

         elsif message=="Week"
         week(@fix_arry)
         text=@fix_arry
         
         puts (text+"を送信します。")


         elsif message.include?('Add')
         content=event.message['text']
         add_todo(content)
         text=(content.delete('Add')+"をtodoリストに追加しました。")
         puts text

         elsif message=="Month"
         month(@fix_arry)
         text=@fix_arry
         puts (text+"を送信します。")

         elsif message.include?('Delete')
         number=event.message['text']
         response=delete(number)
         text=response
         puts text

         else
         text="不正なコマンドが入力されています。"
         puts text
         end
