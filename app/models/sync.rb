class Sync
  include ActiveModel::Serialization
  # A model not backed by active record to provide sync information
  attr_accessor :new, :updated, :updated_image, :deleted, :synced_at

  def initialize()
    @new = []
    @updated = []
    @updated_image = []
    @deleted = []
  end
end

