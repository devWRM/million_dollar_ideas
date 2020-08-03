
class IdeasController < ApplicationController

    get '/ideas' do

        # binding.pry       <= session
        # raise session[:email].inspect
        "You're currently logged in as " + session[:email]
    end

    get '/ideas/new' do

        if !logged_in?
            redirect "/login"
        else
            "Build a new idea form"
        end

    end

    get '/ideas/:id/edit' do

        if !logged_in?
            redirect "/login"
        else
            "Build an edit idea form"
        end

    end









end


