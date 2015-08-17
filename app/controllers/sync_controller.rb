class SyncController < ApplicationController

  def index
    if params[:from]
      @timestamp = params[:from]
      @sync = Sync.new()

      # Goto database once for each model
      @locations = Location.where("updated_at >= ? and active = ?", @timestamp, true).order(id: :asc)


      @location_ids = @locations.ids
      @deleted_location_ids = Location.where("created_at < ? and updated_at >= ? and active = ?", @timestamp, @timestamp, false).order(id: :asc).ids

      @animals = Animal.where("updated_at >= ? and target = ?", @timestamp, true).order(id: :asc)
      @animal_ids = @animals.ids
      @deleted_animal_ids = Animal.where("updated_at >= ? and target = ?", @timestamp, false).order(id: :asc).ids

      @sync.locations= @locations
      @sync.location_ids= @location_ids
      @sync.animals= @animals
      @sync.animal_ids= @animals_ids
      @sync.deleted_location_ids = @deleted_location_ids
      @sync.deleted_animal_ids = @deleted_animal_ids
    end
    render json: @sync, serializer: SyncSerializer
  end
end
