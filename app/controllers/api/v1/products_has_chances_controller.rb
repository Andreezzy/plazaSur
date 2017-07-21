class Api::V1::ProductsHasChancesController < ApplicationController
  before_action :set_products_has_chance, only: [:show, :edit, :update, :destroy]

  # GET /products_has_chances
  # GET /products_has_chances.json
  def index
    @products_has_chances = ProductsHasChance.all
    #@result = Object.new
    #@products_has_chances.each do |x|
      #:temp = x.chance.name
      #@result[:temp] = "a"
    #end
    #raise @result.inspect.to_yaml
  end

  # GET /products_has_chances/1
  # GET /products_has_chances/1.json
  def show
  end

  # GET /products_has_chances/new
  def new
    @products_has_chance = ProductsHasChance.new
  end

  # GET /products_has_chances/1/edit
  def edit
  end

  # POST /products_has_chances
  # POST /products_has_chances.json
  def create
    @products_has_chance = ProductsHasChance.new(products_has_chance_params)

    respond_to do |format|
      if @products_has_chance.save
        format.html { redirect_to @products_has_chance, notice: 'Products has chance was successfully created.' }
        format.json { render :show, status: :created, location: @products_has_chance }
      else
        format.html { render :new }
        format.json { render json: @products_has_chance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_has_chances/1
  # PATCH/PUT /products_has_chances/1.json
  def update
    respond_to do |format|
      if @products_has_chance.update(products_has_chance_params)
        format.html { redirect_to @products_has_chance, notice: 'Products has chance was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_has_chance }
      else
        format.html { render :edit }
        format.json { render json: @products_has_chance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_has_chances/1
  # DELETE /products_has_chances/1.json
  def destroy
    @products_has_chance.destroy
    respond_to do |format|
      format.html { redirect_to products_has_chances_url, notice: 'Products has chance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_has_chance
      @products_has_chance = ProductsHasChance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_has_chance_params
      params.require(:products_has_chance).permit(:product_id, :chance_id)
    end
end
