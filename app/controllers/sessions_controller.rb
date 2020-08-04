
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




        # 26:30 Howard video:  https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be

        # Find/match user with email key and value params[:email]
        @user = User.find_by(email: params[:email])

        # Authenticate user with email & password
        @user.authenticate(params[:password])

        # NOTE 30:50 tux Howard video:  https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be
        # 20:00 tux & 52:00 seed  Howard video:   https://www.youtube.com/watch?v=y5XHoP5qwfY&feature=youtu.be
        
        # Log in the user
        # redirect to user's landing page



        redirect '/ideas'
    end

    get '/logout' do
        logout              # Transferred to logout helpers:    session.clear
        redirect '/ideas'
    end


end
