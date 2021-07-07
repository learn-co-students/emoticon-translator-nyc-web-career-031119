require "yaml"
require "pry"

def load_library(list_of_emoticons)
  emoticons = YAML.load_file(list_of_emoticons)
  library = {}
  
  emoticons.each do |meaning, emoticon_array|
    if !library["get_meaning"]
      library["get_meaning"] = {emoticon_array[1] => meaning}
    else
      library["get_meaning"].merge!({emoticon_array[1] => meaning})
    end
  end
  
  emoticons.each do |meaning1, emoticon_array1|  
    if !library["get_emoticon"]
      library["get_emoticon"] = {emoticon_array1[0] => emoticon_array1[1]}
    else
      library["get_emoticon"].merge!({emoticon_array1[0] => emoticon_array1[1]}) 
    end
  end
  library
end

def get_japanese_emoticon(emoticon_path, emoticon)
  emoticon_library = load_library(emoticon_path)
  
  emoticon_library["get_emoticon"].each do |english, japanese|
    if english == emoticon
      return japanese
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticon_path1, emoticon1)
  emoticon_library1 = load_library(emoticon_path1)
  
  emoticon_library1["get_meaning"].each do |japanese1, meaning1|
    if japanese1 == emoticon1
      return meaning1
    end
  end
  return "Sorry, that emoticon was not found"
end