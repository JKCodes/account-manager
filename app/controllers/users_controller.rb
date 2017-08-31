require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  helpers do 
    def validate_user
      @errors = {}

      if params[:username].empty?
        @errors[:username] = "Username can't be blank"
      elsif User.find_by(username: params[:username])
        @errors[:username] = "Username is already taken"
      end

      if params[:email].empty?
        @errors[:email] = "Email can't be blank"
      elsif User.find_by(email: params[:email])
        @errors[:email] = "Email is already taken"
      end
      
      if params[:password].empty?
        @errors[:password] = "Password can't be blank"
      elsif params[:password].length < 8
        @errors[:password] = "Password must be at least 8 characters in length"
      end
    end

    def valid_login_params?(params)
      if params[:username].empty? || params[:password].empty?
        flash[:message] = "VALIDATION ERROR: Please ensure that both username and password fields are filled out"
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
      @user = User.new
      erb :"users/signup"
    end
  end

  post '/signup' do
    @user = User.new(params)
    validate_user
    if !@errors.empty?
      flash[:message] = "VALIDATION ERROR: #{@errors.first.last}"
      erb :"users/signup"
    elsif @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome to Account Manager, #{@user.username}!"
      redirect "/accounts"
    else 
      flash[:message] = "Something went wrong"
      erb :"users/signup"
    end
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