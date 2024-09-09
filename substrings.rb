# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }
# > substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

def message_to_array(message)
  message_array = message.chars.map do |character|
    if character.match(/[A-Za-z]/)  # filter non-alphabets out
      character
    else
      "." # identifier for the following step to know where each word stops at
    end
  end
  # message_array.join
  message_array.join.split(/[.]/)
end

def substrings(message, dictionary)
  message_array = message_to_array(message)
  dictionary.reduce(Hash.new(0)) do |dict_word, count|
    for word in message_array do
      if "below" == dict_word then
        dict_word[count] += 1
        dict_word
      end
    end
  end
  # p message_array_return.length
  # return message_array_return
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)