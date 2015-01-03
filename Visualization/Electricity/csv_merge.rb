merged_csv = open("merged.csv", "w")

index = 0
Dir.glob("csv/*")  do |file|
  index += 1
  if index == 1
    merged_csv.print open(file).read.encode("UTF-8", "Shift_JIS")
  else
    open(file).read.encode("UTF-8", "Shift_JIS").split("\n").each_with_index do |line, index2|
      merged_csv.print line unless index2 == 0
    end
  end
end