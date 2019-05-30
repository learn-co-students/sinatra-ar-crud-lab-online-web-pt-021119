
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    @articles = Article.all
    erb :index
  end

  get 'articles/:id' do
    erb :show
  end

end
