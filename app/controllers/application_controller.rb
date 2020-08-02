
class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "mycollection"
    end

    get '/' do
        # session[:hey] = "Say what?"
        @world = "Wonderful World!"
        "Hello World"
    end

    get '/task' do
        # session[:hey]
        @world
    end

end
