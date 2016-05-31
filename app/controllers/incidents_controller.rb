class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag]
      @incidents = Incident.tagged_with(params[:tag]).order("created_at DESC")
    else
      @incidents = Incident.all.order("created_at DESC")
    end

  end

  def show
    @comments = Comment.where(commentable_type: "Incident", commentable_id: @incident.id).order("created_at DESC")
    @pictures = Picture.where(pictureable_type: "Incident", pictureable_id: @incident.id).order("created_at DESC")
    @picture_urls = []
    @pictures.each do |picture|
        @picture_urls.push(picture.image.url)
    end
  end

  def new
    @incident = current_user.incidents.build
  end

  def edit
  end

  def create
    @incident = Incident.new(incident_params)

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:description,:title, :tag_list)
    end
end
