require 'yaml'

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  file = YAML.load_file(file_path)
    file.each do |meaning, arr|
    english, japanese = arr
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  element = library["get_emoticon"][emoticon]
  if element
    element
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  element = library["get_meaning"][emoticon]
  if element
    element
  else
    "Sorry, that emoticon was not found"
  end
end