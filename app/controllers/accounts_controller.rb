class AccountsController < ApplicationController

  get '/accounts' do
    redirect_if_not_logged_in
    @accounts = current_user.accounts
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

    @account = Account.find_by(id: params[:id])
    redirect "/accounts" if !@account || @account.user_id != current_user.id

    erb :"accounts/edit"
  end

  post '/accounts' do
    redirect_if_not_logged_in
    redirect "/accounts/new" if params[:name] == "" || params[:balance] == ""

    account = Account.new
    account.name = params[:name]
    account.balance = params[:balance]
    account.user = current_user
    account.save

    redirect "/accounts"
  end

  patch '/accounts/:id' do
    redirect_if_not_logged_in

  end

  delete '/accounts/:id/delete' do
    redirect_if_not_logged_in

  end
end