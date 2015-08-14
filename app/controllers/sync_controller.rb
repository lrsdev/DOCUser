class SyncController < ApplicationController

  def index
    if params[:from]
      @timestamp = params[:from]
      @sync = Sync.new()
      @sync.synced_at= Time.now()
      @locations = Location.where("updated_at >= ?", @timestamp)

      @locations.each do |l|
        if l.active?
          if l.created_at >= @timestamp
            @sync.new << l
          else
            if l.image_updated_at >= @timestamp
              @sync.updated_image << l
            else
              @sync.updated << l
            end
          end
        elsif l.created_at < @timestamp
          @sync.deleted << l.id
        end
      end
    end
    render json: @sync, serializer: SyncSerializer
  end
end
