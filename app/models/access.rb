class Access < ActiveRecord::Base
  belongs_to :location
  validates :geolocation, present: true
end
