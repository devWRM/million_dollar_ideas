
class IdeasController < ApplicationController

    get '/ideas' do
binding.pry
        # binding.pry       <= session
        # raise session[:email].inspect
        "You're currently logged in as " + session[:email]
    end


end


