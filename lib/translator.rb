require "yaml" # require modules here

def load_library(path)
  emoticons = YAML.load_file(path) 
  emoticon_hash = Hash.new
  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new
  emoticons.each do|word, emoticon_set|
  emoticon_hash["get_meaning"][emoticon_set.last] = word
  emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
  end
   return emoticon_hash 
  # code goes here
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  output = emoticon_hash["get_emoticon"][emoticon]
  if output == nil
    output = "Sorry, that emoticon was not found"
  end
  output
  # code goes here
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  output = emoticon_hash["get_meaning"][emoticon]
  if output == nil
    output = "Sorry, that emoticon was not found"
  end
  output
  # code goes here
end