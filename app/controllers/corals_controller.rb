class CoralsController < ApplicationController
  before_action :set_coral, only: [:show, :edit, :update, :destroy]

  # GET /corals
  # GET /corals.json
  # def index
  #   @corals = Coral.all
  # end

  def index
    
    # locs = ["LI"]
    
    query = Coral.all
    # query = query.located(params[:loc]) if params[:loc] && !params[:loc].blank?
    # query = query.exposed(params[:exp]) if params[:exp] && !params[:exp].blank?
    # query = query.gformed(params[:gfo]) if params[:gfo] && !params[:gfo].blank?
    query = query.located(params[:loc]) if params[:loc] && !params[:loc].blank?
    query = query.exposed(params[:exp]) if params[:exp] && !params[:exp].blank?
    query = query.gformed(params[:gfo]) if params[:gfo] && !params[:gfo].blank?
    @corals = query.all
  end

  # GET /corals/1
  # GET /corals/1.json
  def show
    @files = Dir.glob("public/images/csf_files/*")
    @files_csf = Dir.glob("public/images/csf/*")
    @files_outline = Dir.glob("public/images/csf_outlines/*")
  end

  # GET /corals/new
  def new
    @coral = Coral.new
  end

  # GET /corals/1/edit
  def edit
    @files_csf = Dir.glob("public/images/csf/*")
    @files_outline = Dir.glob("public/images/csf_outlines/*")
  end

  # POST /corals
  # POST /corals.json
  def create
    @coral = Coral.new(coral_params)

    if @coral.save
      redirect_to @coral
      flash[:success] = "Coral was successfully created."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /outlines/1
  # PATCH/PUT /outlines/1.json
  def update
    if @coral.update(coral_params)
      redirect_to corals_path
      flash[:success] = "Coral was successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE /outlines/1
  # DELETE /outlines/1.json
  def destroy
    @coral.destroy
    flash[:success] = "Coral was successfully destroyed."
    redirect_to corals_url      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coral
      @coral = Coral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coral_params
      params.require(:coral).permit(:location, :exposure, :image_id, :species, :growth_form, :distance, :notes)
    end
end
