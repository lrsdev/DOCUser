class Location < ActiveRecord::Base
  has_many :reports
  validates :name, :presence => true
  validates :location_type, :presence => true
  validates :blurb, :presence => true
  validates :dog_guide_lines, :presence => true
  validates :dog_status, :presence => true

  enum location_type: [ :beach ]
  enum dog_status: [ :on_lead, :off_lead, :no ]

  has_attached_file :image
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
