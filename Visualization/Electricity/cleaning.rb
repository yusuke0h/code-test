require 'csv'


class CSV::Table
  def group_by(&blk)
    Hash[ super.map { |k, v| [k, CSV::Table.new(v)] } ]
  end
end

day = open("day.csv", "w")
day.print ["date", "amount", "index"].join(","), "\n"
day_index = 0

hour = open("hour.csv", "w")
hour.print ["datetime", "amount", "index"].join(","), "\n"
hour_index = 0

table = CSV.table('./csv/merged.csv')
table.group_by(&:first).each do |date, rows|
  day_index += 1
  day_amount = 0
  rows.each do |row|
    hour_index += 1
    day_amount += row[:amount]
    hour.print [[row[:date], row[:time]].join(" "), row[:amount], hour_index].join(","), "\n"
  end
  day.print [date.last, day_amount, day_index].join(","), "\n"
end
