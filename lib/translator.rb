require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}

  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}

  emoticons.each do |word, set|
    emoticon_hash["get_emoticon"][set.first] = set.last
    emoticon_hash["get_meaning"][set.last] = word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  answer = emoticons["get_emoticon"][emoticon]
  if answer == nil
    answer = "Sorry, that emoticon was not found"
  end
  answer
end

def get_english_meaning(path,emoticon)
  emoticons = load_library(path)
  answer = emoticons["get_meaning"][emoticon]
  if answer == nil
    answer = "Sorry, that emoticon was not found"
  end
  answer
end
