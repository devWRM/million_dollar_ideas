
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
        "Hello World"
    end

    # Testing
    get '/task' do
        # session[:hey]
        @world
    end


    helpers do

        def logged_in?
            !!session[:email]
        end



    end








    

end
