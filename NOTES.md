
RESOURCE: http://sinatrarb.com/faq.html

ORDER OF PROJECT BUILD

STEP 1: Set up folders and files


STEP 2: Build Model classes

        NOTE HAS MANY THROUGH Relationship
        LESSON: TV Land Active Record Associations Lab
        Learn.co Lab: activerecord-tvland-onl01-seng-ft-061520


STEP 3: Build Migrations

_______________________________________________________________________

ADDED an automatic or default creation date for the ideas table:
    t.datetime :date_created, default: -> { 'CURRENT_TIMESTAMP' }
NOTE: https://stackoverflow.com/questions/1580805/how-to-set-a-default-value-for-a-datetime-column-to-record-creation-time-in-a-mi

ADDITIONAL NOTE: https://stackoverflow.com/questions/53804787/rails-5-2-and-active-record-migration-with-current-timestamp

ALSO DATE RELATED:
LESSON: Sinatra Views Lab
Learn.co Lab: sinatra-views-lab-onl01-seng-ft-061520
Solution ex.    <p> The date is <%= Date.today.strftime("%A, %B %d, %Y") %></p>
_______________________________________________________________________


STEP 4: Build Main Controller
        * Make an application_controller.rb file and build the class ApplicationController to inherit from Sinatra::Base
        * Then in the config.ru file: run ApplicationController.rb
        * Now test shotgun

_______________________________________________________________________

STEP 5: Build out Sessions (for Authentication) to ensure user logged in on any page
Resource: http://sinatrarb.com/faq.html#sessions
Sessions video 10:00
https://www.youtube.com/watch?time_continue=66&v=_S1s6R-_wYc&feature=emb_logo
        NOTE @instance variables do NOT work in route-methods but sessions[:key_name] does because state maintained by cookie!

        * SessionsController get '/login' route-method goes to (login.html.erb file) Login page. After a user fills it in & submits, the /sessions action/path in the form boomerangs it back to SessionsController to POST method/request. In post '/sessions' route-method, assign the user entered email to session[:email] and also redirects it to get '/ideas' sending the user entered email in session[:email] to the IdeasController.
        NOTE 26:20 In binding.pry you can check session to see if it contains an email address.








