
require_relative "./config/environment"

require "./config/environment"
use Rack::MethodOverride



# run Main controller ,  use all others
run ApplicationController
use SessionsController
use UsersController
use IdeasController

