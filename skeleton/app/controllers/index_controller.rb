get '/' do
	erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	"#{@anagrams.each}"
	erb :show
end

post '/' do
	@word = params[:word]
	if Word.valid_input?(@word)
		redirect "/anagrams/#{@word}"
	else
		@error = "Please enter a word with three unique letters."
		erb :index
	end
end