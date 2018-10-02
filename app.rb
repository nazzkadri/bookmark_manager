require 'sinatra/base'
require './lib/bookmark'
require 'pry'
require 'sinatra/flash'
require 'uri'


class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
  # let's print out the form params
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL" unless Bookmark.create(params[:title], params[:url])
    #Bookmark.create(params[:url])
    redirect '/bookmarks'
  end

    run! if app_file == $0
end
