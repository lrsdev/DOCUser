class ReportSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :blurb, :image, :geolocation
  belongs_to :location

  def image
    {'thumbnail': object.image.url(:thumb),
     'medium': object.image.url(:medium)}
  end

  def geolocation
    {'latitude': object.geolocation.y, 'longitude': object.geolocation.x}
  end
end
