class AccountsController < ApplicationController

  configure do
    set :views, 'app/views/accounts'
  end

  get '/accounts' do
    erb :index
  end
end