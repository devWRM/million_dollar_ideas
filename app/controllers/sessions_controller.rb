
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
            redirect "/users/#{@user.id}"
            #  xxxxx     erb :"sessions/user.html"      <=> user.html.erb file


        else
            # message to user: Incorrect input
            # will break unless redirect to login page


        end

        redirect '/ideas'
    end
    # END OF:   post '/sessions'        <=> post '/login'

  
    get '/signup' do
        # This will show/render signup form
        erb :"sessions/signup"
    end

    post '/users' do

        "You made it to the route where brand new users will be created, which means your sign up succeeded!"

        # Create new user
        # Persist new user to the database

        # Verify data exists then create & presist with:        @user = User.create(params)
        # params => {"email"=>"abe@email.com", "password"=>"abe"}
        
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            # Use params for mass assignment:   User.create(params)
            @user = User.create(params)


            # Courtesy login: create their session (assign key value pair to session hash)
            session[:user_id] = @user.id


            # Send to user's show page: 35:00 Howard video: https://www.youtube.com/watch?v=Xc02QEeYrcs&feature=youtu.be
            redirect "/users/#{@user.id}"
            # It is the job of get '/users/:id' block-method to show:    erb :'/users/show'
            
        else
            "Enter valid signup data"
        end

    end




    get '/users/:id' do

        # Using @user so the erb file has access to it
        @user = User.find_by(id: params[:id])

        erb :'/users/show'

                        ##### dreamer = (User.find_by(email: session[:email]))[:name]
                        ##### "User  ** #{dreamer.upcase} **  landing show page route"
        # User.find_by(email: session[:email])
        # (User.find_by(email: session[:email]))[:name]
    end










    get '/logout' do
        logout              # Transferred to logout helpers:    session.clear
        redirect '/'
    end


end
