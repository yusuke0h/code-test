require 'singleton'
require 'yaml'
require 'benchmark'

# Singletonを使ったClass
class SingSetting
  include Singleton
  def initialize
    @settings = YAML.load_file("settings.yml")
  end

  def [](key)
    @settings[key]
  end
end

# Singletonをフルスクラッチで作る
class MySingSetting
  def self.instance
    @settings ||= YAML.load_file("settings.yml")
  end

  def self.[](key)
    @settings[key]
  end

  private
  def self.new
    raise   #=> `open': No such file or directory - "nonexist" (Errno::ENOENT)
  end
end

# Singletonを使わないClass
class NormalSetting
  def initialize
    @settings = YAML.load_file("settings.yml")
  end

  def [](key)
    @settings[key]
  end
end

# Instanceの同一性を確認
puts "Instanceの同一性を確認"
p SingSetting.instance.object_id
p SingSetting.instance.object_id
puts ""

p MySingSetting.instance.object_id
p MySingSetting.instance.object_id
puts ""

p NormalSetting.new.object_id
p NormalSetting.new.object_id
puts ""

# 処理速度の差を体感
result = Benchmark.realtime do
  100.times do
    setting = SingSetting.instance
    print setting['os'], " "
  end
end
puts ""
puts "SingSetting 処理概要 #{result}s"

result = Benchmark.realtime do
  100.times do
    setting = MySingSetting.instance
    print setting['os'], " "
  end
end
puts ""
puts "MySingSetting 処理概要 #{result}s"

result = Benchmark.realtime do
  100.times do
    setting = NormalSetting.new
    print setting['os'], " "
  end
end
puts ""
puts "NormalSetting 処理概要 #{result}s"




