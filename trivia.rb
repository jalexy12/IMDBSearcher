require 'imdb'
require 'awesome_print'
require "sinatra/reloader" 
require 'sinatra'
require 'pry'
enable :sessions
set :session_secret, 'movie_secrets'


def how_many_posters(movies)
	movie_list = []

	movies.each do |i|
		if movie_list.length < 9 && i.poster != nil
			movie_list.push(i)
		end
	end
	movie_list
end

# search = Imdb::Search.new('rashamon')

# ap search.moviese


get '/' do 
	erb :index
		
end

get '/search' do
	erb :search
end




post "/search_movies" do
	@search = Imdb::Search.new(params[:movie_term])
	@search_results = @search.movies
	@top_movies = @search_results[0..20]
	@clean_list =  how_many_posters(@top_movies)
	erb :search_results	
end


 # get "/movie_results" do
	# 
 # end




