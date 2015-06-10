class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    if(params.has_key?(:location_id))
      @reports = Array.wrap(Report.where(location_id: params[:location_id]))
    else
      @reports = Report.all 
    end

    render json: @reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    render json: @report
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    image_params = params[:image]
    encoded_image = image_params[:image_data]
    content_type = image_params[:image_content_type]
    image = Paperclip.io_adapters.for("data:#{content_type};base64,#{encoded_image}")
    image.original_filename = image_params[:image_filename]
    @report.image = image
    
    lat = params[:latitude]
    long = params[:longitude]
    p = RGeo::Cartesian.factory.point(lat, long)
    @report.geolocation = p

    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      head :no_content
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy

    head :no_content
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(:location_id, :user_id, :animal_id, :blurb, :geolocation, :submitted_at)
  end

  def extra_params
    params.permit(:image, :latitude, :longitude)
  end
end
