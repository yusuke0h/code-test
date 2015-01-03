require 'pp'
require 'nokogiri'
require 'natto'
require 'json'
include Math

snippets = JSON.load(open("./snippets.json").read)

surfaces = Hash.new(0)
features = Hash.new { |h,k| h[k] = []}
bow = Hash.new { |h,k| h[k] = Hash.new(0)}
df = Hash.new(0)


nm = Natto::MeCab.new
snippets.each_with_index do |snippet, index|
  nm.parse(snippet) do |n|
    bow[index][n.surface] += 1 if n.feature.split(",").first == "名詞" && n.surface.size > 1
  end
end

bow.each{|index, tf| tf.keys.each{|word| df[word] += 1 }}

tf = Hash.new(0)
bow.values.each{ |doc| doc.each{ |word, freq| tf[word] += freq} }

tfidf = Hash.new(0.0)
tf.each do |word, freq|
  tfidf[word] = Math.log(freq.to_f) * Math.log(snippets.size.to_f/df[word].to_f)
end

pp tfidf.sort_by{|k,v| -v}

# pp df.sort_by{|k,v| v}

# nm.parse(snippets.join) do |n|
#   surfaces[n.surface] += 1
#   features[n.surface] << n.feature
# end

# surfaces.sort_by { |k,v|  v }.each do |k, v|
#   puts "#{k}\t#{v}\t#{features[k].uniq}"
# end