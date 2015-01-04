require 'csv'

class CSV::Table
  def group_by(&blk)
    Hash[ super.map { |k, v| [k, CSV::Table.new(v)] } ]
  end
end

puts ["index", "date", "temperature", "precipitation", "humidity", "location"].join(",")
table = CSV.table('./csv/year_ave.csv')

table.each do |row|
  puts row if [1, 2, 3, 12].include?(row[:date].split("/").first.to_i)
end