class Sync
  include ActiveModel::Serialization
  # A model not backed by active record to provide sync information
  attr_accessor :locations, :animals, :location_ids, :animal_ids, :deleted_location_ids, :deleted_animal_ids, :synced_at

  def initialize()
    @synced_at = Time.now()
  end
end

