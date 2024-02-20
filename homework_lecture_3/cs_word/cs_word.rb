def cs_word(word)
  if word.downcase.end_with?('cs')
    2**word.length
  else
    word.reverse
  end
end
