
class SessionsController < ApplicationController

    # NOTE Nowhere never do we call SessionsController.new but we do create a session that does or does not have an email

    get '/login' do     # '/sessions/new'
        erb :"sessions/login.html"
    end

    post '/sessions' do
        ### NOTE Should be an if statement checking that an email exists ex. if params[:email] == ""  'Please enter an email'
    
        # raise params.inspect
        # collecting the params entry and passing it into the login method call
        login(params[:email])                # Transferred to login helpers: session[:email] = params[:email]
        # raise session[:email].inspect

        redirect '/ideas'
    end

    get '/logout' do
        logout              # Transferred to logout helpers:    session.clear
        redirect '/ideas'
    end


end
