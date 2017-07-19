class Api::V1::ChancesController < ApplicationController
  before_action :set_chance, only: [:show, :edit, :update, :destroy]

  # GET /chances
  # GET /chances.json
  def index
    @chances = Chance.all
  end

  # GET /chances/1
  # GET /chances/1.json
  def show
  end

  # GET /chances/new
  def new
    @chance = Chance.new
  end

  # GET /chances/1/edit
  def edit
  end

  # POST /chances
  # POST /chances.json
  def create
    @chance = Chance.new(chance_params)

    respond_to do |format|
      if @chance.save
        format.html { redirect_to @chance, notice: 'Chance was successfully created.' }
        format.json { render :show, status: :created, location: @chance }
      else
        format.html { render :new }
        format.json { render json: @chance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chances/1
  # PATCH/PUT /chances/1.json
  def update
    respond_to do |format|
      if @chance.update(chance_params)
        format.html { redirect_to @chance, notice: 'Chance was successfully updated.' }
        format.json { render :show, status: :ok, location: @chance }
      else
        format.html { render :edit }
        format.json { render json: @chance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chances/1
  # DELETE /chances/1.json
  def destroy
    @chance.destroy
    respond_to do |format|
      format.html { redirect_to chances_url, notice: 'Chance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chance
      @chance = Chance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chance_params
      params.require(:chance).permit(:name, :products_id)
    end
end
