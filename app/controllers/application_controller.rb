
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/post' do
    binding.pry
    Model.create(title: params[:title])
    erb :new
  end
end
