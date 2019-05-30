
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new

    #@article = Article.create(params[:title], params[:content])
#
    #redirect 'articles'
  end

  #post '/articles' do
  #  erb :index
  #end
#
  #get 'articles/:id' do
  #  erb :show
  #end

end
