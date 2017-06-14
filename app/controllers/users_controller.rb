class UsersController < ApplicationController

  configure do
    set :views, 'app/views/users'
  end

  get '/signup' do
    erb :signup
  end

  post 'signup' do

  end

  get '/login' do
    erb
  end

  post 'login' do
  end

  get '/logout' do
  end
end