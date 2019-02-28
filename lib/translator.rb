# require modules here
require 'yaml'
require 'pry'
#require_relative "emoticons.yaml" --> might not need it

    # the keys inside the 'get_meaning' hash are the Japanese emoticons
    # the values inside the 'get_meaning' hash are their meanings
    # the keys inside the 'get_emoticon' hash are the English emoticons
    # the values inside the 'get_emoticon' hash are their Japanese equivalents

def load_library(file_path)
  # code goes here
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emo_hash = YAML.load_file(file_path)
  emo_hash.each do |meaning, emoticons|
    new_hash["get_meaning"][emoticons[1]] = meaning
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_hash
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
