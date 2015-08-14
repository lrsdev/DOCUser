class AnimalSync
  include ActiveModel::Serialization
  attr_accessor :new, :updated, :updated_image, :deleted

  def initialize()
    @new = []
    @updated = []
    @updated_image = []
    @deleted = []
  end
end

