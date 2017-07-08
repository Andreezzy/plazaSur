class Api::V1::UnitiesController < ApplicationController
  before_action :set_unity, only: [:show, :edit, :update, :destroy]

  # GET /unities
  # GET /unities.json
  def index
    @unities = Unity.all
  end

  # GET /unities/1
  # GET /unities/1.json
  def show
  end

  # GET /unities/new
  def new
    @unity = Unity.new
  end

  # GET /unities/1/edit
  def edit
  end

  # POST /unities
  # POST /unities.json
  def create
    @unity = Unity.new(unity_params)

    respond_to do |format|
      if @unity.save
        format.html { redirect_to api_v1_unity_path(@unity), notice: 'Unity was successfully created.' }
        format.json { render :show, status: :created, location: @unity }
      else
        format.html { render :new }
        format.json { render json: @unity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unities/1
  # PATCH/PUT /unities/1.json
  def update
    respond_to do |format|
      if @unity.update(unity_params)
        format.html { redirect_to api_v1_unity_path(@unity), notice: 'Unity was successfully updated.' }
        format.json { render :show, status: :ok, location: @unity }
      else
        format.html { render :edit }
        format.json { render json: @unity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unities/1
  # DELETE /unities/1.json
  def destroy
    @unity.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_unities_path, notice: 'Unity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unity
      @unity = Unity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unity_params
      params.require(:unity).permit(:unity)
    end
end
