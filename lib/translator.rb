require 'yaml'
require 'pp'

def load_library(path)
  
  output = {}
  data = YAML.load_file(path)

  output[:get_meaning]  = {}
  output[:get_emoticon] = {}
  
  for item in data
  
    meaning = item[0]
    emot    = item[1][0]
    jemot   = item[1][1]
  
    output[:get_meaning][jemot] = meaning
    output[:get_emoticon][emot] = jemot
    
  end
  
  output

end



def get_japanese_emoticon(path, emot)
  
  data = load_library(path)
  
  output = data[:get_emoticon][emot]
  
  if output == nil
    
    return "Sorry, that emoticon was not found"
    
  else
    
    return output
    
  end
  
end



def get_english_meaning(path, emot)
  
  data = load_library(path)
  
  output = data[:get_meaning][emot]
  
  if output == nil
    
    return "Sorry, that emoticon was not found"
    
  else
    
    return output
    
  end
  
end