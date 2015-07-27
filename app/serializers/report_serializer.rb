class ReportSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :blurb, :image, :geolocation, :animal_id, :created_at, :animal_type
  belongs_to :location
  belongs_to :animal

  def image
    {'thumbnail': object.image.url(:thumb),
     'medium': object.image.url(:medium)}
  end

  def geolocation
    {'latitude': object.geolocation.y, 'longitude': object.geolocation.x}
  end
end
