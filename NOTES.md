
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





