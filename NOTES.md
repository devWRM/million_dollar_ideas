





ADDED an automatic or default creation date for the ideas table:
    t.datetime :date_created, default: -> { 'CURRENT_TIMESTAMP' }
NOTE: https://stackoverflow.com/questions/1580805/how-to-set-a-default-value-for-a-datetime-column-to-record-creation-time-in-a-mi

ADDITIONAL NOTE: https://stackoverflow.com/questions/53804787/rails-5-2-and-active-record-migration-with-current-timestamp
