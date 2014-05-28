class WaitingTime < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :provider
end
