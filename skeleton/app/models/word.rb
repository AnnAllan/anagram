class Word < ActiveRecord::Base
	def self.find_anagrams(string)
		input = string.split(//)
		anagrams = Array.new
		input.length.times do
			anagrams.push(input.join(""))
			anagrams.push(last_three_letters(input).join(""))
			last_three_letters(input)
			input.push(input.shift)
		end
		real = []
		anagrams.each do |combo|
			if Word.find_by_text(combo).present?
				real << combo
			end
		end
		return real
	end

	def self.last_three_letters(input)
		first_letter = input.shift
		input = reverse_letters(input)
		input.unshift(first_letter)
		return input
	end

	def self.reverse_letters(input)
		temp = input[0]
		input[0] = input[1]
		input[1] = temp
		return input
	end
	
	def self.three_letters?(input)
		if input.length <= 3
			true
		else
			false
		end
	end
	
	def self.distinct_letters?(input)
		letter_array = input.chars
		unique_letters = letter_array.uniq
		if unique_letters.length == letter_array.length
			true
		else
			false
		end
	end
	
	def self.valid_input?(input)
		if three_letters?(input) && distinct_letters?(input)
			true
		else
			false
		end
	end
end
