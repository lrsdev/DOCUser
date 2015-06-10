class Location < ActiveRecord::Base
  has_many :reports
  validates :name, :presence => true
  validates :location_type, :presence => true
  validates :blurb, :presence => true
  validates :dog_guidelines, :presence => true
  validates :dog_status, :presence => true

  # Enums for state representation 0 =>
  enum location_type: [ :beach ]
  enum dog_status: [ "on lead", "off lead", "no dogs" ]

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def access_points
    a = Array.new
    geo_access_points.each {|p| a << {'latitude': p.x, 'longitude': p.y}}
    return a
  end

  # Return last 5 reports in JSON response
  def as_json(options = {})
    {
      :id => id,
      :location_type => location_type,
      :blurb => blurb,
      :dog_guidelines => dog_guidelines,
      :dog_status => dog_status,
      :name => name,
      :image_thumb => image.url(:thumb),
      :image_medium => image.url(:medium),
      :sightings => Report.where(location_id: id),
      :access_points => access_points
    }
  end
end
