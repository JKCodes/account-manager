class AccountsController < ApplicationController

  get '/accounts' do
    erb :"accounts/index"
  end
end