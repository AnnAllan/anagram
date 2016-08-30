require_relative 'reverse_letters'

def find_anagram(word)
	input = word.split(//)
	anagrams = Array.new
	input.length.times do
		anagrams.push(input.join(""))
		anagrams.push(last_three_letters(input).join(""))
		last_three_letters(input)
		input.push(input.shift)
	end
	return anagrams
end

def last_three_letters(input)
	first_letter = input.shift
	input = reverse_letters(input)
	input.unshift(first_letter)
	return input
end


