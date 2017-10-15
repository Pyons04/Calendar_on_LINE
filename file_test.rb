  def file_read(fix_arry)
#ファイルの読み込み
     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     @fix_arry=s.join("\n")#配列オブジェクトを改行を入れて文字列に変換
end

        @fix_arry=""
        file_read(@fix_arry)
        text=@fix_arry
        puts text