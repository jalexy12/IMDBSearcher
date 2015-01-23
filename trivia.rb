require 'imdb'
require 'awesome_print'
require "sinatra/reloader" 
require 'sinatra'
require 'pry'
enable :sessions
set :session_secret, 'movie_secrets'


# search = Imdb::Search.new('rashamon')

# ap search.movies


get '/' do 
	erb :index
		
end

get '/search' do
	erb :search
end

post "/search_movies" do
	
	@search = Imdb::Search.new(params[:movie_term])
	@search_results = @search.movies
	@top_nine = @search_results[0..8]
	erb :search_results
	 

	
end

 # get "/movie_results" do
	# 
 # end




