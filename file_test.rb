        @paraData=[]  #空の配列を作成
        @paraData=File.open("notebook.txt").readlines
        @paraData.each do |data|
        puts(data)
        end
