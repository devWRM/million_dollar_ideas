

class UsersController < ApplicationController

    # From SessionsController 'signup'
    post '/users' do

        # Create new user
        # Persist new user to the database

        # Verify data exists then create & presist with:        @user = User.create(params)
        # params => {"email"=>"abe@email.com", "password"=>"abe"}

        redirect '/login' if User.find_by(email: params[:email])
        
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            # Use params for mass assignment:   User.create(params)
            @user = User.create(params)

            # Courtesy login: create their session (assign key value pair to session hash)
            session[:user_id] = @user.id

            # Send to user's show page: 35:00 Howard video: https://www.youtube.com/watch?v=Xc02QEeYrcs&feature=youtu.be
            redirect "/users/#{@user.id}"
            # It is the job of get '/users/:id' block-method to show:    erb :'/users/show'
            
        else
            # Eventually add a failure message: "Enter valid signup data"

            redirect '/signup'
        end
    end

    
    get '/users/:id' do

        # Using @user so the erb file has access to it
        @user = User.find_by(id: params[:id])
                # if @user == nil
                #     redirect '/'
                # end

        erb :'/users/show'

                        ##### dreamer = (User.find_by(email: session[:email]))[:name]
                        ##### "User  ** #{dreamer.upcase} **  landing show page route"
        # User.find_by(email: session[:email])
        # (User.find_by(email: session[:email]))[:name]
    end



end


