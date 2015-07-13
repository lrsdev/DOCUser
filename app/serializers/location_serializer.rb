class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :geolocation, :category, :blurb, :image
  has_many :accesses
  has_many :reports 
  has_many :dog_statuses, :key => :dog_status

  def image
    {'thumbnail': object.image.url(:thumb),
     'medium': object.image.url(:medium)}
  end

  def geolocation
    {'latitude': object.geolocation.y, 'longitude': object.geolocation.x}
  end

  # Only the current dog status needs to be returned for location.
  # root argument removes extra dog_status key in response.
  def dog_statuses
    object.dog_statuses.last
  end
end

