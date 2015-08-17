class Sync
  include ActiveModel::Serialization
  # A model not backed by active record to provide sync information
  attr_accessor :locations, :animals, :deleted_location_ids, 
    :deleted_animal_ids, :synced_at, :sync_elapsed

  def initialize()
    @synced_at = Time.now()
  end
end

