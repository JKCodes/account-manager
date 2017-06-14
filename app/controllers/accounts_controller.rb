require 'rack-flash'

class AccountsController < ApplicationController
  use Rack::Flash

  helpers do 
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "You must be logged in to access anything account related"
        redirect "/login" if !logged_in?
      end
    end

    def process_id(id)
      @account = users_account_from_id(id)
      if !@account 
        flash[:message] = "You either do not have access to this account, or this account simply does not exist"
        redirect "/accounts" if !@account
      end
    end

    def valid_params?(params)
      if params[:name].empty? || params[:balance].empty?
        flash[:message] = "VALIDATION ERROR: Please ensure that both name and balance fields are filled out"
        false
      elsif params[:balance].to_i < 0
        flash[:message] = "VALIDATION ERROR: Balance must be greater than or equal to 0"
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

    process_id(params[:id])
    erb :"accounts/show"
  end

  get '/accounts/:id/edit' do
    redirect_if_not_logged_in

    process_id(params[:id])
    @account = users_account_from_id(params[:id])
    erb :"accounts/edit"
  end

  post '/accounts' do
    redirect_if_not_logged_in
    redirect "/accounts/new" if !valid_params?(params)

    account = current_user.accounts.build(params)
    account.save

    redirect "/accounts"
  end

  patch '/accounts/:id' do
    redirect_if_not_logged_in
    redirect "/accounts/#{params[:id]}/edit" if !valid_params?(params)

    account = users_account_from_id(params[:id])
    account.update(name: params[:name], balance: params[:balance])

    redirect "/accounts/#{account.id}"
  end

  delete '/accounts/:id/delete' do
    redirect_if_not_logged_in
    account = users_account_from_id(params[:id])
    account.delete

    redirect "/accounts"
  end
end