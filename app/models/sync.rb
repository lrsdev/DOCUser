class Sync
  include ActiveModel::Serialization
  # A model not backed by active record to provide sync information
  attr_accessor :locations, :animals, :synced_at

  def initialize()
    @synced_at = Time.now()
  end
end

