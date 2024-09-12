# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }
# > substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

# 1st attempt (unsuccessful)
# def word_split(word)
#   word_array = word.chars.map do |character|
#     if character.match(/[A-Za-z]/)  # filter non-alphabets out
#       character
#     else
#       "." # identifier for the following step to know where each word stops at
#     end
#   end
# end
# def message_to_array(message)
#   message_array = word_split(message)
#   message_array.join.split(/[.]/)
# end

# def substrings(message, dictionary)
#   message_array = message_to_array(message)
#   dictionary.reduce(Hash.new(0)) do |dict_word, count|
#   index = 0
#     if message_array.any? { |word| word >= dictionary[index] } then
#       dict_word[count] += 1
#       dict_word  
#       index += 1
#     end
#   end
# end

# 2nd attempt
def substrings(message, dictionary)
  message_downcase = message.downcase # standardize letter case with 'dictionary'
  new_hash = Hash.new(0)
  dictionary.each do |dict_word|
    counter = message_downcase.scan(dict_word).length  # .scan seeks and pushes each time 'dict_word' appears in 'message_downcase' into an array; .length outputs the array length to output the number times 'dict_word' appeared
    new_hash[dict_word] = counter if counter > 0  # omit hash keys with no value
  end
  new_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)