require 'rack-flash'

class AccountsController < ApplicationController
  use Rack::Flash

  helpers do 
    def redirect_if_not_logged_in
      redirect "/login" if !logged_in?
    end

    def process_ids(id)
      @account = current_user.accounts.find_by(id: id)
      redirect "/accounts" if !@account
    end

    def valid_params?(params)
      if params[:name].empty? || params[:balance].empty?
        flash[:message] = "VALIDATION ERROR: Please ensure that both name and balance fields are filled out"
        false
      else
        true
      end
    end

    def users_account_from_id(id)
      current_user.accounts.find_by(id: id)
    end
  end

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
    process_ids(params[:id])

    erb :"accounts/show"
  end

  get '/accounts/:id/edit' do
    redirect_if_not_logged_in
    process_ids(params[:id])
    @account = users_account_from_id(params[:id])
    erb :"accounts/edit"
  end

  post '/accounts' do
    redirect_if_not_logged_in
    redirect "/accounts/new" if !valid_params?(params)

    account = Account.new
    account.name = params[:name]
    account.balance = params[:balance]
    account.user = current_user
    account.save

    redirect "/accounts"
  end

  patch '/accounts/:id' do
    redirect_if_not_logged_in
    redirect "/accounts/#{params[:id]}/edit" if !valid_params?(params)
    account = users_account_from_id(params[:id])
    account.name = params[:name]
    account.balance = params[:balance]
    account.save

    redirect "/accounts/#{account.id}"
  end

  delete '/accounts/:id/delete' do
    redirect_if_not_logged_in
    account = users_account_from_id(params[:id])
    account.delete

    redirect "/accounts"
  end
end