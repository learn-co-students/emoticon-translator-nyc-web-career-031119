# require modules here
require 'yaml'

def load_library(file_path)
  emojis = Hash.new
  emoticons = YAML.load_file(file_path)
  emojis["get_meaning"] = {}
  emojis["get_emoticon"] = {}
  emoticons.each do |name, data|
    emojis["get_emoticon"][data.first] = data.last
    emojis["get_meaning"][data.last] = name
end
emojis
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  translation = ""
  emo_hash = load_library(file_path)
  emo_hash["get_emoticon"].each do |english, japanese|
    if english == emoticon
      translation = japanese
    end
  end
  if translation == ""
    translation = "Sorry, that emoticon was not found"
  end
  translation
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  translation = ""
  emo_hash = load_library(file_path)
  emo_hash["get_meaning"].each do |japanese, meaning|
    if japanese == emoticon
      translation = meaning
    end
  end
  if translation == ""
    translation = "Sorry, that emoticon was not found"
  end
  translation
end
