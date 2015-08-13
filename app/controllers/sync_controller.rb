class SyncController < ApplicationController

  def index
    if params[:from]
      @locations = Location.where("updated_at >= ?", params[:from])
      @sync = Sync.new()
      @sync.updated = @locations
      render json: @locations, serializer: LocationSerializer
    end
  end

end
