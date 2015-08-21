class Animal < ActiveRecord::Base
  validates :name, presence: true
  validates :blurb, presence: true
  validates :guidelines, presence: true
  validates :target, inclusion: { in: [true, false] }
  validates :ext_url, presence: true

  has_many :reports

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Serializing the target attribute as active instead.
  def active
    return self.target
  end
end
