class UsersController < ApplicationController

  configure do
    set :views, 'app/views/users'
  end

  get '/signup' do
    if logged_in?
      redirect "/accounts"
    else
      erb :signup
    end
  end

  post '/signup' do
    # Refactor line below later
    redirect "signup" if params[:username] == "" || params[:email] == "" || params[:password] == ""

    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    user.save
    session[:user_id] = user.id

    redirect "/accounts"
  end

  get '/login' do
    if logged_in?
      redirect "/accounts"
    else
      erb :login
    end
  end

  post 'login' do
  end

  get '/logout' do
  end
end