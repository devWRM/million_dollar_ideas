
class SessionsController < ApplicationController

    # NOTE Nowhere never do we call SessionsController.new but we do create a session that does or does not have an email

    get '/login' do     # '/sessions/new'
        erb :"sessions/login.html"

        # What is the proper way to write the above (with or without quotation marks)
            # 16:50 Howard:     https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be
            # 29:00 Avi:        https://www.youtube.com/watch?time_continue=66&v=_S1s6R-_wYc&feature=emb_logo
    end

    post '/sessions' do
        ### NOTE Should be an if statement checking that an email exists ex. if params[:email] == ""  'Please enter an email'
    
        # raise params.inspect
        # collecting the params entry and passing it into the login method call
        login(params[:email])                # Transferred to login helpers: session[:email] = params[:email]
        # raise session[:email].inspect

        # 26:30 Howard video:  https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be

        # NOTE 30:50 tux Howard video:  https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be
        # 20:00 tux & 52:00 seed  Howard video:   https://www.youtube.com/watch?v=y5XHoP5qwfY&feature=youtu.be
        

        # Find/match user with email key and value params[:email]
        @user = User.find_by(email: params[:email])

        # Authenticate user with email & password
        if @user.authenticate(params[:password])
            # Log in the user by creating their session (assign key value pair to session hash)
            session[:user_id] = @user.id

            # redirect to user's landing show page
            redirect "users/#{@user.id}"
            #  xxxxx     erb :"sessions/user.html"      <=> user.html.erb file


        else
            # message to user: Incorrect input
            # will break unless redirect to login page


        end

        redirect '/ideas'
    end
    # END OF:   post '/sessions'        <=> post '/login'

  
    get '/signup' do

    end

    get '/users/:id' do
        "User's landing show page route"
    end










    get '/logout' do
        logout              # Transferred to logout helpers:    session.clear
        redirect '/ideas'
    end


end
