# require modules here
require 'yaml'
require 'pry'
def load_library(file_path)
  # code goes here "get_emoticon", "get_meaning"
  emojis ={}
  emoticons = YAML.load_file(file_path)
  emojis["get_emoticon"] ={} #creates new hashes
  emojis["get_meaning"] ={}
  emoticons.each do |name, data|
    emojis["get_emoticon"][data.first] = data.last #sets hashes as keys
    emojis["get_meaning"][data.last] = name
  #flips data:
  #"get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞" // "get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel",
  end
    #binding.pry
emojis
end


def get_japanese_emoticon(file_path, given_emoji)
  # code goes here
  emojis = load_library(file_path)
  # emojis.each do |get_emoji, both_emojis|
  #   both_emojis.each do |eng_em, jap_em|
      # if eng_emoji == [eng_em]
      #   jap_emoji = [jap_em]
  jap_emoji = emojis["get_emoticon"][given_emoji]#displays jap imoji for eng emoji given
      if jap_emoji == nil
        jap_emoji = "Sorry, that emoticon was not found"
  #  binding.pry
  end
  jap_emoji
end

def get_english_meaning(file_path, given_emoji)
  # code goes here
emojis = load_library(file_path)
eng_emoji = emojis["get_meaning"][given_emoji]
  if eng_emoji == nil
    eng_emoji = "Sorry, that emoticon was not found"
  end
  eng_emoji
end
