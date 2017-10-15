def read_file(para_data)
  @paraData=File.open("notebook.txt").readlines
 end


@para_Data=[]  #空の配列を作成
read_file(@para_data)  #配列を引数として渡す
@paraData.each do |data|
puts(data)
end
