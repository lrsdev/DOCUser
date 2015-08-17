class SyncController < ApplicationController

  def index
    if params[:from]
      @timestamp = params[:from]
      @sync = Sync.new()
      @locations = Location.where("updated_at >= ? and active = ?", @timestamp, true).order(id: :asc)
      @animals = Animal.where("updated_at >= ? and target = ?", @timestamp, true).order(id: :asc)
#      build_sync_object(@sync.location_sync, @locations)
#      build_sync_object(@sync.animal_sync, @animals)
      @sync.locations= @locations
      @sync.animals= @animals
    end
    render json: @sync, serializer: SyncSerializer
  end

  def build_sync_object(sync_object, collection)
    collection.each do |l|
        if l.active
          if l.created_at >= @timestamp
            sync_object.new << l
          else
            if l.image_updated_at >= @timestamp
              sync_object.image_updated << l
            else
              sync_object.updated << l
            end
          end
        elsif l.created_at < @timestamp
          sync_object.deleted << l.id
        end
      end
  end

end
