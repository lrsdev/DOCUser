class SyncController < ApplicationController

  def index
    if params[:from]
      @timestamp = params[:from]
      @sync = Sync.new()

      # Goto database once for each model
      @locations = Location.where("updated_at >= ?", @timestamp).order(id: :asc)
      @animals = Animal.where("updated_at >= ?", @timestamp).order(id: :asc)

      # Get active locations from active record relation
      @sync.locations= @locations.where("active = ?", true)
      @sync.location_ids= @locations.where("active = ?", true).ids
      # Only include deletes for records the user should have
      @sync.deleted_location_ids= @locations.where("active = ? and created_at < ?", false, @timestamp)

      # Animals
      @sync.animals= @animals.where("target = ?", true)
      @sync.animal_ids= @animals.where("target = ?", true).ids
      @sync.deleted_animal_ids= @animals.where("target = ? and created_at < ?", false, @timestamp)

      @sync.sync_elapsed= Time.now - @sync.synced_at
    end
    render json: @sync, serializer: SyncSerializer
  end
end
