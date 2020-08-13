
FROM THE CONTROLLER: ideas_controller.rb
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


==================================================================

IDEAS
title: Soar Feet
category: Foot Wear
inspiration: Relief from sore feet through flight
summary: Soar Feet gentle elevates you inches above the ground and glides you to your destination.


name: "Elia",
email: "eel@email.com"









****************************************************************
FILE: views/ideas/edit.erb

<h1>EDIT IDEA: <%= current_user.name %>!</h1>

<h3>Mandatory fields: Title, Category, Inspiration, and Summary</h3>
<form class="" method="POST" action="/ideas/<%= @idea.id %>">
    <input type="hidden" name="_method" value="patch" />

    <p><label for="title">Title</label>
    <input type="text" name="title" value="<%= @idea.title %>" placeholder="" /></p>
    <p><label for="category">Category</label>
    <input type="text" name="category" value="<%= @idea.category %>" /></p>
    <p><label for="inspiration">Inspiration</label>
    <input type="text" name="inspiration" value="<%= @idea.inspiration %>" /></p>
    
    <p><label for="summary">Summary</label>
    <textarea name="summary" style="width:auto; height:auto;"><%= @idea.summary %></textarea></p>
    <p><label for="timeline_plan">Timeline Plan</label>
    <input type="text" name="timeline_plan" value="<%= @idea.timeline_plan %>" /></p>
    <p><label for="action_steps_accomplished">Action Steps Accomplished</label>
    <input type="text" name="action_steps_accomplished" value="<%= @idea.action_steps_accomplished %>" /></p>
    
    <p><label for="resources">Resources</label>
    <input type="text" name="resources" value="<%= @idea.resources %>" /></p>
    <p><label for="total_budgeted_dollars">Total Budgeted Dollars</label>
    <input type="integer" name="total_budgeted_dollars" value="<%= @idea.total_budgeted_dollars %>" /></p>
    <p><label for="total_spent_dollars">Total Spent Dollars</label>
    <input type="integer" name="total_spent_dollars" value="<%= @idea.total_spent_dollars %>" /></p>
        
    <input type="submit" name="" value="Create" />
</form>

****************************************************************


