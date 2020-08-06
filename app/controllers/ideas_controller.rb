
class IdeasController < ApplicationController

    get '/ideas' do

        # binding.pry       <= session hash exists!
        # raise session[:email].inspect

        ## logged_in? is working BUT absent emails still considered logged in SOLUTION: Had to refer directly to "" in session[:email] so now the if statement works BUT without the "Login please" message
        ### NOTE session[:email] == string (empty or not)
        ### NOTE session == hash (that contains an email key with a string value that's empty or not)

        ### NOTE !session[:email] & !logged_in? have the same false value (when email address NOT entered) so why do I need to include both in the if statement ???
        # Are both !session[:email] and !logged_in? testing for the same thing ???
        # NO!!!! They are not! Because: 
        # session[:email] tests if the email key exists or not WHILE... 
        # logged_in? tests for an empty string value

        # logged_in updated to consider both if email key exists && if the string value is not empty
                if !logged_in?
                    "Login please"
                    redirect "/login"
                end

        # "You've reached the IDEAS page."
        ##### Why did the below stop working:
        # "You're currently logged in as " + session[:email]
        # "You're currently logged in as #{session[:email]}"
        "Welcome to IDEAS, user #{User.find_by(email: session[:email]).name}!"
        # User.find_by(email: session[:email]).name
    end

    get '/ideas/new' do
        # Render a form to create a new idea

        if !logged_in?     # session[:email] == ""     # !session[:email]    # !logged_in?
            redirect '/login'
        else

            # @user = current_user

            # New idea form
            erb :'/ideas/new'
        end

    end

    post '/ideas' do
        # Receive the new idea data then create the new idea & persist it to the database

        

    end





    get '/ideas/show' do


        erb :'/ideas/show'
    end



    # get '/ideas/all' do

    #     @ideas = Idea.all
    #     erb :'/ideas/show'

    # end



    # get 'ideas/:id' do
    #     @idea = Idea.all
    #     erb : '/ideas'

    # end



    get '/ideas/:id/edit' do
        # NOTE Substitute any number for :id when checking this block-method in the browser

        if !logged_in?
            redirect '/login'
        else
            "Build an edit idea form"
        end

    end









end


