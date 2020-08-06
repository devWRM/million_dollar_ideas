
class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "mycollection"
    end

    # Testing
    get '/' do
        # session[:hey] = "Say what?"
        @world = "Wonderful World!"
        "Welcome to the Homepage of MILLION DOLLAR IDEAS"
    end

    # Testing
    get '/task' do
        # session[:hey]
        @world
    end


    helpers do

        def logged_in?
            # ORIGINAL:     !!session[:email] && session[:email] != ""
            
            !!current_user

            # NOTE Why do I have to use both
            # BECAUSE Need an email key to exist && need the value not to be an empty string

            # NOTE  !session[:email] is NOT testing for the presence of an empty string so...       what is it testing for ?????
            # CONCLUSION I believe Avi can use !!session[:email] because the email key does not exist in his session hash when an email address was not entered by user HOWEVER an email key does exist for me but it has an empty string
            # NOTE Avi debug error 23:00 in video:  https://www.youtube.com/watch?time_continue=66&v=_S1s6R-_wYc&feature=emb_logo
            # SPECIFICALLY 23:49 Avi expected session[:email] to contain the user email address input from params[:email] while in PostsController but the message did NOT print out a value for session[:email]
            # THEN SPECIFICALLY at 25:50 the session hash does NOT have an email key
            # BUT SPECIFICALLY at 26:20 the session has has an email key after Avi deleted from config.ru:   use Rack::Session::Cookie

            # 34:30 Avi uses only this code and it works for him:  !!session[:email]
            # 30:30 PostsController uses if statements with: !session[:email] 
        end

        def login(email) 
            session[:email] = email
        end

        def logout
            session.clear
        end


        def current_user
            # Use find_by instead of find to get a nil return instead of an error
            # User.find(session[:user_id])
            @current_user ||= User.find_by(id: session[:user_id])
            # Above is memoization: once set, won't make another database call unless new ApplicationController created

        end


    end










end
