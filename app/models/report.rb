class Report < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  belongs_to :location, dependent: :destroy

  validates :location_id, :presence => true
  validates :user_id, :presence => true

  def location
    return {'latitude': geolocation.x, 'longitude': geolocation.y} 
  end

  def as_json(options={})
    {
      :id => id,
      :location_id => location_id,
      :location_name => Location.find(location_id).name,
      :blurb => blurb,
      :image_medium => image.url(:medium),
      :image_thumb => image.url(:thumb),
      :submitted_at => submitted_at,
      :geo_location => location,
    }
  end

end
