
class IdeasController < ApplicationController


    get '/ideas' do

        if !logged_in?
            redirect '/'
        end

        # Load all the ideas from the database so on the erb page you can iterate for the user's ideas
        @ideas = Idea.all

        # NOTE Use pry on the erb page inside of <% erb tags %>
            # ex.   <% binding.pry %>
        erb :'ideas/index'
    end

    get '/test' do

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

        # logged_in refactored to consider both if email key exists && if the string value is not empty
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

        if !logged_in?
            redirect '/'
        end

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
        
        # If user logged in and...
        # BETTER CODE: redirect '/' unless logged_in?
        if !logged_in?
            redirect '/'
        end



        

        # ...if params has data 
        if params[:title] != "" && params[:category] != "" && params[:inspiration] != "" && params[:summary] != ""
            # @idea = Idea.create(title: params[:title], category: params[:category], inspiration: params[:inspiration], summary: params[:summary], user_id: current_user.id)
            

            @idea = current_user.ideas.create(params)

            
            # BROKEN =>     @idea = Idea.create(params, user: current_user)

            # THE FIX: Why did I need THE FIX ??
            # @idea.user_id = current_user.id
            # @idea.save
              
            redirect "/ideas/#{@idea.id}"
        else
            redirect '/ideas/new'
        end

    end

    get '/ideas/:id' do
        # Dynamic route because it changes to find a specific idea
    # binding.pry

        # set_idea replaces: @idea = Idea.find(params[:id])
        # set_idea
        @idea = Idea.find(params[:id])

        erb :'/ideas/show'

    end

    # get '/ideas/show' do
    #     erb :'/ideas/show'
    # end

    get '/ideas/:id/edit' do
    
        # An edit idea FORM will show in the browser
        # Populate the edit idea form with previous data by retrieving it from the database
        # set_idea finds the idea, replaces:    @idea = Idea.find(params[:id])
        set_idea

        # THE FIX TEST
        # @idea.user_id = current_user.id

# binding.pry
        if logged_in?
# binding.pry
            # ORIG: if @idea.user_id == current_user.id
            if @idea.user == current_user
# binding.pry
                # user confirmed (2 checks) to edit idea
                erb :'/ideas/edit'
            else
                # user NOT current_user so redirected to OWN show page NOT edit page of other users
                # redirect "/users/:id"
                redirect "/users/#{current_user.id}"
            end
        else
            # user NOT logged in so redirected to Welcome page
            redirect '/'
        end


        ## Original if statement
        # if !logged_in?
        #     redirect '/login'
        # else
        #     erb :'/ideas/edit'
        # end

    end

        # The PATCH route is why config.ru has: use Rack::MethodOverride
    patch '/ideas/:id' do  
        # Find the idea:    Idea.find(params[:id])
        # set_idea finds the idea, replaces:    @idea = Idea.find(params[:id])
        set_idea

        if logged_in?
                if @idea.user == current_user

                    # Update the selected idea
                    # CANNOT !!! mass assign because patch method in hash unknown to ActiveRecord:  @idea.update(params)
                    @idea.update({title: params[:title], category: params[:category], inspiration: params[:inspiration], summary: params[:summary], timeline_plan: params[:timeline_plan], action_steps_accomplished: params[:action_steps_accomplished], resources: params[:resources], total_budgeted_dollars: params[:total_budgeted_dollars], total_spent_dollars: params[:total_spent_dollars]})
                        
                    # Redirect to the show page to see the updated idea
                    # ORIG: redirect "/ideas/#{@idea[:id]}"
                    redirect "/ideas/#{@idea.id}"
                else
                    redirect "/users/#{current_user.id}"
                end
        else
            redirect '/'
        end

    end

    ##### BOTH DELETE ROUTES BELOW WORK #####

    # delete '/ideas/:id' do
    #     @idea = Idea.find(params[:id])
    #     @idea.destroy
    #     redirect '/ideas'
    # end

    delete '/ideas/:id' do
        set_idea
        @idea.destroy if @idea.user == current_user
               
        
            redirect "/ideas"
       
    end
    
########################################################

    # get '/all' do   
    # end

    # get '/ideas/all' do
    #     @ideas = Idea.all
    #     erb :'/ideas/show'
    # end




    private

    def set_idea
        @idea = Idea.find(params[:id])
    end


end


