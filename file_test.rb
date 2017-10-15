        @paraData=[]  #空の配列を作成
        @paraData=File.open("notebook.txt"){|f|
        puts("--------------------------")
        f.each_line{|line|
          p line
        }
      }
        puts("--------------------------")
        @paraData=File.open("notebook.txt")
        @paraData.each do |data|
        puts(data)
        end
