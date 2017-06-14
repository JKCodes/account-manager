require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  helpers do 
    def valid_signup_params?(params)
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
        flash[:message] = "VALIDATION ERROR: Please ensure that all three fields are filled out"
        false
      else
        true
      end
    end

    def valid_login_params?(params)
      if params[:username] == "" || params[:password] == ""
        flash[:message] = "VALIDATION ERROR: Please ensure that both email and password fields are filled out"
        false
      else
        true
      end
    end
  end

  get '/signup' do
    if logged_in?
      redirect "/accounts"
    else
      erb :"users/signup"
    end
  end

  post '/signup' do
    redirect "signup" if !valid_signup_params?(params)

    user = User.new
    #note: I am intentionally not downcasing usernames
    user.username = params[:username]
    user.email = params[:email].downcase
    user.password = params[:password]
    user.save
    session[:user_id] = user.id

    redirect "/accounts"
  end

  get '/login' do
    if logged_in?
      redirect "/accounts"
    else
      erb :"users/login"
    end
  end

  post '/login' do
    redirect "/login" if !valid_login_params?(params)
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/accounts"
    else
      flash[:message] = "AUTHENTICATION ERROR: Invalid username/password combination"
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear if logged_in?
    redirect "/login"
  end
end