class WaitingTime < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :provider
end
