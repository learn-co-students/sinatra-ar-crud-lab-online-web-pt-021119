require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  #new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #show
  get '/articles/:id' do
    if @article = Article.find(params[:id])
      erb :show
    else
      erb "No article with id: #{params[:id]} found"
    end
  end

  #edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #destory
  delete '/articles/:id/delete' do
    Article.destroy(params[:id])
    redirect '/articles'
  end

end
