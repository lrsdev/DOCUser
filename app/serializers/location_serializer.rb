class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :geolocation
  has_many :reports

  def geolocation
    {'latitude': object.geolocation.y, 'longitude': object.geolocation.x}
  end

end
