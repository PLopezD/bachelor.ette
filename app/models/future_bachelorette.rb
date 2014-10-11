# A queue representing all registered users
# who will eventually become bachelorettes.
# Each person is flagged either "closed"
# or "open" to represent whether or not they
# were already bachelorettes

class FutureBachelorette < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :users
end
