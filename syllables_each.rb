require 'action_view'
include ActionView::Helpers::TextHelper

vowel_arr = ["a", "e", "i", "o", "u", "y"]

string_arr = ["local", "frogs", "dry", "person", "submission", "vegetable", "yes", "real", "there", "fearsome", "languish", "lament", "table", "cycle", "ladle", "amphitropous", "inconsequential", "unremittence", "dairy", "bile", "apple", "intervale", "belle"]

string_arr.each do |word|
  syll = 0
  letters = word.chars
  last_letter_vowel = false
  letters.each_with_index do |letter, i|
    vowel_arr.each do |vowel|
      if letter == vowel
        syll += 1
        if i >= 1 && last_letter_vowel == true
          syll -= 1
        end
        if i == 0 && letter =='y'
          syll -= 1
        end
        if i == letters.length-1 && letter == 'e' && (letters[i-1] != "l" || (letters[i-1]== 'l' && letters[i-2] =~ /[aily]/))
          syll -= 1
        end
        last_letter_vowel = true
        break
      end
      if vowel == vowel_arr.last
        last_letter_vowel = false
      end
    end
   end  
  if syll <= 0
    syll = 1
  end
  puts "#{word} has " + pluralize(syll, 'syllable')
  # puts "#{word} has #{syll} syllables"
 end