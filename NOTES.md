
RESOURCE: http://sinatrarb.com/faq.html

ORDER OF PROJECT BUILD

STEP 1: Set up folders and files
    Howard video: https://www.youtube.com/watch?v=y5XHoP5qwfY&feature=youtu.be
    23:00 Howard explains: use Rack::MethodOverride

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
        NOTE @instance variables do NOT work in block-methods but sessions[:key_name] does because state maintained by cookie!

        * SessionsController get '/login' block-method goes to (login.html.erb file) Login page. After a user fills it in & submits, the /sessions action/path in the form boomerangs it back to SessionsController to POST method/request. In post '/sessions' block-method, assign the user entered email to session[:email] and also redirects it to get '/ideas' sending the user entered email in session[:email] to the IdeasController.
        NOTE 26:20 In binding.pry you can check session to see if it contains an email address.
_______________________________________________________________________

STEP 6: The IdeasController need conditions to block non-logged in activity. Put these special conditional methods inside a helper method so that they're accessible across all controllers. The helper method should be located in the ApplicationController since all other controllers inherit from it. All controllers will call on these "helper" methods inherited from the ApplicationController to set conditions to block non-logged in activity. 
27:00
    NOTE If email is NOT entered there is still a session but it does not have an email address.

NOTE: !session[:email] - DIFFERS FROM - !logged_in?
    !session[:email] tests if the email key exists or not WHILE... 
    !logged_in? tests for an empty string value
_______________________________________________________________________

STEP 7: Ensure user logging in has signed up previously. Build the password functionality.

NOTE Avi video link:
    https://www.youtube.com/watch?time_continue=66&v=_S1s6R-_wYc&feature=emb_logo

NOTE Howard video links in GitHub:
    https://github.com/howardbdev/sinatra-journal-app/blob/master/video_links.md

    Use rake console & seed data to test the authenticate method: abe.authenticate("abe")
    NOTE To render, use quotation marks when a slash (/) denotes a folder
        ex.     erb :login     -but-       erb :"sessions/login"

    NOTE Reference ApplicationController helper method: def current_user
            find will return an error if not found, example:
                User.find(session[:user_id])
            find_by will return nil if not found, example:
                User.find_by(id: session[:user_id])

NOTE 01:00:00 Howard video explains MEMOIZTION (to avoid multiple database calls)
    https://www.youtube.com/watch?v=U5glnUNaJPs&feature=youtu.be
    Example:    @current_user ||= User.find_by(id: session[:user_id])

******** seeds Howard video 55:00 ********

******** continue in Avi video at 55:00 ********









Original for file: login.html.erb
# <h3>Login Page</h3>

# <form action="/sessions" method="POST">
#     <label for="email">Enter your email address</label>
#     <input type="text" name="email" id="email" />
#     <input type="submit" />
# </form>



