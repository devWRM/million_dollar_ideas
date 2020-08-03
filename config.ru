
require_relative "./config/environment"

# Allows 
# Keep this requirement at the top of the page
require "./config/environment"
use Rack::MethodOverride



# run Main controller ,  use all others
run ApplicationController
use SessionsController
use UsersController
use IdeasController

