        @paraData=[]  #空の配列を作成
        @paraData=File.open("notebook.txt").readlines
        puts("--------------------------")
        puts @paraData
        puts("--------------------------")
        @paraData.each do |data|
        puts(data)
        end
