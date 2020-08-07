
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

        erb :'/ideas/new'

        # if !logged_in?     # session[:email] == ""     # !session[:email]    # !logged_in?
        #     redirect '/login'
        # else

        #     # @user = current_user

        #     # New idea form
        #     erb :'/ideas/new'
        # end

    end

    # post '/ideas/ideas' do
    post '/ideas' do
        # Receive the new idea data then: create & persist idea to the database
        # If it has data & user logged in
        
        if !logged_in?
            redirect '/'
        end

        if params[:title] != "" && params[:category] != "" && params[:inspiration] != "" && params[:summary] != ""
            @idea = Idea.create(title: params[:title], category: params[:category], inspiration: params[:inspiration], summary: params[:inspiration], user_id: current_user.id)
            redirect "/ideas/#{@idea.id}"
        else
            redirect '/ideas/new'
        end

    end

    get '/ideas/:id' do
        # Dynamic route because it changes to find a specific idea


        @idea = Idea.find(params[:id])
        erb :'/ideas/show'

    end

    # get '/ideas/show' do
    #     erb :'/ideas/show'
    # end

    get '/ideas/:id/edit' do
        # An edit idea form will show in the browser
        # Populate the edit idea form with previous data by retrieving it from the database
        @idea = Idea.find(params[:id])

        if !logged_in?
            redirect '/login'
        else
            erb :'/ideas/edit'
            # # # /ideas/18/edit
        end

    end

    patch '/ideas/19' do

        @idea = Idea.update(title: params[:title], category: params[:category], inspiration: params[:inspiration], summary: params[:inspiration], user_id: current_user.id)



        
        
        redirect "/ideas/#{@idea.id}"
      end

    # This is why config.ru has: use Rack::MethodOverride








    get '/all' do
        
    end

    # get '/ideas/all' do
    #     @ideas = Idea.all
    #     erb :'/ideas/show'
    # end



    



    



    









end


