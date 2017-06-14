class UsersController < ApplicationController

  configure do
    set :views, 'app/views/users'
  end

  get '/' do
  end

  get '/signup' do

  end

  post 'signup' do
  end

  get '/login' do
  end

  post 'login' do
  end

  get '/logout' do
  end
end