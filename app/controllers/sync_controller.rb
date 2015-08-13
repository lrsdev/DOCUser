class SyncController < ApplicationController

  def index
    if params[:from]

      # Return all locations that have had some sort of update since last sync
      @locations = Location.where("updated_at >= ?", params[:from])
      @sync = Sync.new()

      @locations.each do |l|
        # if record was created after last sync
        if l.created_at >= params[:from] and l.active?
          @sync.new << l

        # no longer active, and was created before last sync, client needs to delete
        elsif !l.active? and created_at < params[:from]
          @sync.deleted << l.id

        # record exists with client, and has been updated
        else
          
          # image and possibly some text attributes have been updated
          if l.image_updated_at >= params[:from]
            @sync.updated_image << l

          # some text attribute has been updated
          else
            @sync.updated << l
          end
        end
      end
    end

    render json: @sync, serializer: SyncSerializer
  end
end
