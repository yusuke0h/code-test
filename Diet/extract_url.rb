require 'pp'
require 'nokogiri'

regexp = []
parser_url = []
snippets = []

Dir.glob("./HTML/*.html") do |file|
  doc = open(file).read
  doc.scan(/<a href="http.?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+" on/).each{|url| regexp << url.gsub("<a href=\"", "").gsub("\" on", "")}
  doc = Nokogiri::HTML.parse(doc)
  doc.css('li.g h3.r > a').each do |a|
    parser_url << a.attributes['href'].value
  end
  doc.css('li.g span.st').each do |span|
    snippets << span.children.text
  end
  # exit
end

puts "正規表現"
regexp.each{ |url| puts url}

puts ""
puts "HTMLパーサ"
parser_url.each{|url| puts url}

puts ""
puts "regexp - parser_url"
pp regexp - parser_url

puts ""
puts "parser_url - regexp"
pp parser_url - regexp

open("snippets.json", "w").print JSON.pretty_generate(snippets)
