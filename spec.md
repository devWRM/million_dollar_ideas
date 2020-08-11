# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    I used Sinatra to build this app

- [x] Use ActiveRecord for storing information in a database
    I used ActiveRecord for storing information in my database

- [x] Include more than one model class (User & Idea)
    I included User and Idea models

- [x] Include at least one has_many relationship on your User model (User has_many Ideas)
    A user has many ideas
    
- [x] Include at least one belongs_to relationship on another model (Idea belongs_to User)
    An idea belongs to a user

- [x] Include user accounts with unique login attribute (username or email)
    Users login in with email address and password

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Create  get '/ideas/new'
    Read    get '/index'
            get '/ideas/:id'
    Update  get '/ideas/:id/edit'
    Destroy delete '/ideas/:id'

- [x] Ensure that users can't modify content created by other users
    current_user = User.find_by(id: session[:user_id])
    @idea = Idea.find(params[:id])
    if @idea.user == current_user

- [x] Include user input validations
    @user = User.find_by(email: params[:email])
    if @user == nil
    if @user.authenticate(params[:password])


- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)


- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    Installation not necessary if deployed on Heroku

Confirm
- [x] You have a large number of small Git commits
    156 commits

- [x] Your commit messages are meaningful
    first commit
    Fixed the broken href '/' route
    Coded to list all of 1 user's ideas as title links    
    Coded the ideas show page

- [x] You made the changes in a commit that relate to the commit message
    app/views/ideas/show.erb
        - Coded to reveal all the data for a single idea
    app/controllers/ideas_controller.rb
        - replaced the hard-coded 19 in: patch '/ideas/:id'

- [x] You don't include changes in a commit that aren't related to the commit message
    True so there are no examples
