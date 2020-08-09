
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
_______________________________________________________________________

STEP 8: Build out Signup 

NOTE Howard video link opens with explanation of how BYCRYPT works:
    sinatra journal app part 3
    https://www.youtube.com/watch?v=Xc02QEeYrcs&feature=youtu.be
        - include gem in Gemfile
            gem 'bcrypt', '~> 3.1.7'
        - include macro in User model class
            has_secure_password
        - which gives access to ActiveRecord method authenticate in...
        post '/sessions'  <=same as=> post '/login'
            @user.authenticate(params[:password])

NOTE 10:30 When testing signup (with shotgun) in the browser:
    In the terminal (9393) will show the request: GET /signup HTTP
    The number 200 means it was successful

NOTE 13:00 Explains RESTful convention
    When you create something new (ex. user) in the database:
        method => post
        action => the plural of what's being created (ex. users)

NOTE 25:30 Create new user and persist to the database

NOTE 35:00 redirect (url address)   -vs-    erb (file path) render
    - Render (erb) from get block-methods only: erb uses @instance_variables
        ** Users NEVER SEE the method call for the file BUT they see what's in the file
    - Redirect from post, patch, delete
        ** redirect is a BROWSER address call
        * redirect sometimes uses interpolation
_______________________________________________________________________

STEP 9: Welcome page to tie in Signup & Login

NOTE Howard video link: sinatra journal app part 4
    https://www.youtube.com/watch?v=PXmnoCIcH7w&feature=youtu.be

NOTE 14:30 & 21:00 Adds a menu/nav bar        <= to the layout page


!!!!!!!!! 15:30 Howard refactors get '/' route with an if statement !!!!!!!!!
    NOTE Use "DOUBLE QUOTATION MARKS" when #{INTERPOLATING}
    - user logged in => user show page
    - user NOT logged in => welcome page
_______________________________________________________________________

STEP 10: CREATE & READ a single idea

NOTE Howard video link: sinatra journal app part 4
    https://www.youtube.com/watch?v=PXmnoCIcH7w&feature=youtu.be

22:00

NOTE 24:00 Check if Controllers are functioning with a get message (call it in the browser)

30:00 IdeasController 4 Tasks 
    - get ideas/new to render a form to create a new idea
    - post ideas to take in the new idea data then create a new idea & persist it to the database
    - get show to show a single idea entry
    - get index to show list of all ideas

NOTE    * ideas/new has missing columns *
    t.datetime "date_created"
 => t.datetime "deadline_date"                  <= countdown
    t.integer "remaining_budgeted_dollars"
    t.boolean "within_budget"
    t.integer "user_id"

        * ideas/new mandatory columns *
    t.string "title"
    t.string "category"
    t.string "inspiration"
    t.string "summary"
    t.datetime "date_created"

        * ideas/new calculated columns *
    t.integer "remaining_budgeted_dollars"
    t.boolean "within_budget"

        * ideas/new users can't set nor edit *
    t.datetime "date_created"
    t.integer "remaining_budgeted_dollars"  <= Not directly
    t.boolean "within_budget"               <= Not directly

NOTE 53:10 Shotgun: 200 => successful action    404 => failed action

NOTE 55:45 Dynamic Route in IdeasController

_______________________________________________________________________

STEP 11:    UPDATE (edit) a user's idea
            

NOTE Howard video link: sinatra journal app part 5
    https://www.youtube.com/watch?v=3-LyguyWNDQ&feature=youtu.be

NOTE 17:00 Populate the edit idea form with previous data 2 different ways
    - ** Use value in the appropriate input tag:
        value="<%= @idea.title %>"
    - placeholder in the appropriate input tag:
        placeholder="<%= @idea.title %>"
    
NOTE 23:20 Why config.ru has: use Rack::MethodOverride
    An erb page usually has a GET or POST method
    The override allows a different HTTP verb PATCH for method
        NOTE Need PATCH to change Existing data

NOTE 28:00 Resize the edit form text boxes
    WORKING
    <textarea name="summary" style="width:auto; height:auto;"><%= @idea.summary %></textarea>

NOTE The session has information about the user, NOT the ideas
NOTE The params has information on the most recent/last passed in data
NOTE You raise params.inpect to see the information that has been passed in
_______________________________________________________________________

STEP 12:    49:00 Limit users' ability to only be able to edit own ideas          
            Code out ability to create empty content for ideas

NOTE Howard video link: sinatra journal app part 5
    https://www.youtube.com/watch?v=3-LyguyWNDQ&feature=youtu.be

NOTE 53:15 To ensure a user can ONLY edit their OWN ideas:
    - check if user is logged in
    - check if user is current_user
    NOTE If user fails either one above, in IdeasController:
        53:30 user shouldn't be able to make changes to the edit form
            get '/ideas/:id/edit'       <= if statement in this route
            patch '/ideas/:id'          <= if statement in this route
        ??:00 user shouldn't be able to see the edit form
            

!NOTE!  Git message for users/show.erb: "Changed to current_user.name because  @user.name no longer held user information !NOTE! Trying to access user info from the IdeasController which does not have user information (except through current_user) because refactored if statement to consider both logged_in? AND curent_user"
        - Added if statement to the get '/ideas/:id/edit' route to consider both logged in AND current_user
_______________________________________________________________________

STEP 13:    READ (list) all of a user's ideas as title links (to each individual idea)

NOTE: Howard video link: sinatra journal app part 6
    https://www.youtube.com/watch?v=uW0LVCvkIYM&feature=youtu.be

NOTE    Local variables inside of a block are scoped to that block
        Local variables inside of a method are scoped to that method









52:00 STOPPED HERE  <=      <=      <=      <= 






FROM File: users/show.erb
<h1>You're at <%= @user.name %>'s user show page!!</h1>





Original for file: login.html.erb
# <h3>Login Page</h3>

# <form action="/sessions" method="POST">
#     <label for="email">Enter your email address</label>
#     <input type="text" name="email" id="email" />
#     <input type="submit" />
# </form>



