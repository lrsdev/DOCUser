class Sync
  include ActiveModel::Serialization
  # A model not backed by active record to provide sync information
  attr_accessor :location_sync, :animal_sync, :synced_at

  def initialize()
    @synced_at = Time.now()
    @location_sync = LocationSync.new
    @animal_sync = AnimalSync.new
  end
end

