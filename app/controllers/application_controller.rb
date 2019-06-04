require 'pry'
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

    erb :"new"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :"show"
  end

  get '/articles/:id/edit' do
    @article_edit = Article.find(params[:id])

    erb :"edit"
  end

  patch '/articles/:id' do
    @article_edit = Article.find(params[:id])
    @article_edit.title = params[:title]
    @article_edit.content = params[:content]
    @article_edit.save

    redirect to '/articles/' + article.id.to_s
  end

  get '/articles' do
    @articles = Article.all

    erb :"index"
  end

  post '/articles' do
    article = Article.new(params)
    article.save

    redirect to '/articles/' + article.id.to_s
  end

  delete '/articles/:id' do
    Article.delete(params[:id])

    redirect to '/articles'
  end

end
