require 'csv'

class CSV::Table
  def group_by(&blk)
    Hash[ super.map { |k, v| [k, CSV::Table.new(v)] } ]
  end
end

puts ["index", "date", "temperature", "precipitation", "humidity", "location"].join(",")
table = CSV.table('./csv/clean_data.csv')
table.group_by{|row| row[:location]}.each do |locate, locate_table|
  locate_table.group_by{|row| row[:date][5..10]}.each_with_index  do |(day, day_table), index|
    temperature, precipitation, humidity = [0.0, 0.0, 0.0]
    day_table.each  do |row|
      temperature += row[:temperature]
      precipitation += row[:precipitation]
      humidity += row[:humidity]
    end
    temperature, precipitation, humidity =
          [temperature/day_table.size.to_f, precipitation/day_table.size.to_f, humidity/day_table.size.to_f ]
    puts [index, day, temperature, precipitation, humidity, locate].join(",")
  end
end
