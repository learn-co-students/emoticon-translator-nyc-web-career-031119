# require modules here
require "pry"
require "yaml"
# emoticons = YAML.load_file('lib/emoticons.yml')
# # emoticons

def load_library (path)
  new_hash = {}
  emoticons = YAML.load_file(path)
  
   new_hash["get_emoticon"] = {}
   new_hash["get_meaning"] = {}
  

english = 0
japan = 1

  emoticons.each do |word, emot_array|
    # emot_array.each do |emoji_type|
      
  new_hash["get_meaning"][emot_array[japan]] = word
  new_hash["get_emoticon"][emot_array[english]] = emot_array[japan]
   
    #   new_hash["get_meaning"][emot_array[english]] = emot_array[japan]
    #   new_hash["get_emoticon"][emot_array[japan]] = emot_desc emot_array[english]
    # 
    # end
  end
  new_hash
end



def get_japanese_emoticon(path, emoji)
  yaml_hash = load_library(path)
  
  converted = yaml_hash["get_emoticon"][emoji]
  
  if converted
    converted 
    # = yaml_hash["get_emoticon"][emoji]
  else
   converted = "Sorry, that emoticon was not found"
  end
  converted
  
end

def get_english_meaning(path, emoji)
  
   loaded = load_library(path)
   results = loaded["get_meaning"][emoji]
   
  if results
    results
  else
   results = "Sorry, that emoticon was not found"
  end
  results
end