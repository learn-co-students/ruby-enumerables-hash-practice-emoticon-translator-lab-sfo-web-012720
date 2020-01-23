require "yaml"

def load_library(path)
  output = {"get_meaning": {}, "get_emoticon": {}}
  emoticons = YAML.load_file(path)
  emoticons.each do |keys, emo|
    output[:get_meaning][emo[1]] = keys
    output[:get_emoticon][emo[0]] = emo[1]
  end
  output
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  output = nil
  if !emoticons[:get_emoticon][emoticon]
    output = "Sorry, that emoticon was not found"
  else
    output = emoticons[:get_emoticon][emoticon]
  end
  output
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  output = nil
  if !emoticons[:get_meaning][emoticon]
    output = "Sorry, that emoticon was not found"
  else
    output = emoticons[:get_meaning][emoticon]
  end
  output
end
