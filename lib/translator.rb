# require modules here
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each { |english,set|
    emoticon_hash["get_emoticon"][set.first] = set.last
    emoticon_hash["get_meaning"][set.last] = english
  }
  emoticon_hash
end

def get_japanese_emoticon(path,emoticon)
  emoticon_hash = load_library(path)
  translation = emoticon_hash["get_emoticon"][emoticon]
  if translation == nil
    translation = "Sorry, that emoticon was not found"
  end
  translation
end

def get_english_meaning(path,emoticon)
  emoticon_hash = load_library(path)
  translation = emoticon_hash['get_meaning'][emoticon]
  if translation == nil
    translation = 'Sorry, that emoticon was not found'
  end
  translation
end
