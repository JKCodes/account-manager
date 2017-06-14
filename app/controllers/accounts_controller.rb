class AccountsController < ApplicationController

  get '/accounts' do
    redirect_if_not_logged_in
    @accounts = Account.find_by(id: session[:user_id])
    
    erb :"accounts/index"
  end

  get '/accounts/new' do
    redirect_if_not_logged_in

    erb :"accounts/new"
  end

  get '/accounts/:id' do
    redirect_if_not_logged_in

    erb :"accounts/show"
  end

  get '/accounts/:id/edit' do
    redirect_if_not_logged_in

    erb :"accounts/edit"
  end

  post '/accounts' do
    redirect_if_not_logged_in

  end

  patch '/accounts/:id' do
    redirect_if_not_logged_in

  end

  delete '/accounts/:id/delete' do
    redirect_if_not_logged_in

  end
end