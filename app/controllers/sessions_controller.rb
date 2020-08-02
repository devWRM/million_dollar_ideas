
class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        # raise params.inspect
        session[:email] = params[:email]
        # raise session[:email].inspect

        redirect '/ideas'

    end

    get '/logout' do

    end


end
