     s = []
     File.open("notebook.txt", mode = "rt"){|f|
     s = f.readlines
     }
     puts s

     fix_arry=s.join("\n")
     puts fix_arry
