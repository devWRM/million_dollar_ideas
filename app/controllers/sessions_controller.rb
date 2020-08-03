
class SessionsController < ApplicationController

    # NOTE Nowhere never do we call SessionsController.new but we do create a session that does or does not have an email

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        ### NOTE Should be an if statement checking that an email exists ex. if params[:email] == ""  'Please enter an email'
    
        # raise params.inspect
        session[:email] = params[:email]
        # raise session[:email].inspect

        redirect '/ideas'

    end

    get '/logout' do
        session.clear
    end


end
