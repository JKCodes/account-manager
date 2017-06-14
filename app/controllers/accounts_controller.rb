class AccountsController < ApplicationController

  get '/accounts' do
    erb :"accounts/index"
  end

  get '/accounts/new' do
    erb :"accounts/new"
  end

  get '/accounts/:id' do
    erb :"accounts/show"
  end

  get '/accounts/:id/edit' do
    erb :"accounts/edit"
  end

  post '/accounts' do
  end

  patch '/accounts/:id' do
  end

  delete '/accounts/:id/delete' do
  end
end