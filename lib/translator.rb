# require modules here
require "YAML"
def load_library(path)
  # code goes here
emoticons = YAML.load_file(path)
emoticon_hash = Hash.new

emoticon_hash["get_emoticon"] = Hash.new
emoticon_hash["get_meaning"] = Hash.new

emoticons.each do |english, emoticon_list|
  emoticon_hash["get_emoticon"][emoticon_list.first] = emoticon_list.last
  emoticon_hash["get_meaning"][emoticon_list.last] = english
end
emoticon_hash
end



def get_japanese_emoticon(path, emoticon)
  # code goes here
  answer = ""
  emoticon_hash = load_library("./lib/emoticons.yml")
  emoticon_hash.each do |get, info|
    info.each do |list, japanese|
      if list == emoticon
        answer = japanese
      end
    end
  end
if answer == ""
  answer = "Sorry, that emoticon was not found"
end
answer
end

def get_english_meaning(path, emoticon)
  # code goes here
answer = ""
emoticon_hash = load_library("./lib/emoticons.yml")
emoticon_hash.each do |get, info|
  info.each do |k, v|
    if k == emoticon
      answer = v
    end
  end
end
if answer == ""
  answer = "Sorry, that emoticon was not found"
end
answer
end
