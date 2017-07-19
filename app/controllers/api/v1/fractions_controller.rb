class Api::V1::FractionsController < ApplicationController
  before_action :set_fraction, only: [:show, :edit, :update, :destroy]

  # GET /fractions
  # GET /fractions.json
  def index
    @totalReg = Fraction.all.count

    @limit = params.has_key?(:limit) ? params[:limit].to_i : 10
    @page = params.has_key?(:page) ? params[:page].to_i : 1

    @status = 200
    @msg = "ok"

    @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)

    @start = ((@page-1) * @limit) +1
    

    @sortDirection = params.has_key?(:sortDirection) && params[:sortDirection] == 'ascending' ? 'ASC' : 'DESC'
    @sortBy = params.has_key?(:sortBy) ? params[:sortBy] : 'name'
    @findBy = params.has_key?(:findBy) ? params[:findBy] : 'name'


    if !params.has_key?(:limit) && !params.has_key?(:page) && !params.has_key?(:findQuery)
      @fractions = Fraction.first(@limit)
      #raise @providers.size.to_yaml
      @end = Fraction.page(@page).last_page? ? @start + @fractions.size - 1  : @start + @limit -1
      return
    end
    
    @fractions = Fraction.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @fractions = Fraction.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @fractions.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Fraction.page(@page).last_page? ? @start + @fractions.size - 1  : @start + @limit -1
  end

  # GET /fractions/1
  # GET /fractions/1.json
  def show
  end

  # GET /fractions/new
  def new
    @fraction = Fraction.new
  end

  # GET /fractions/1/edit
  def edit
  end

  # POST /fractions
  # POST /fractions.json
  def create
    @fraction = Fraction.new(fraction_params)

    respond_to do |format|
      if @fraction.save
        format.html { redirect_to @fraction, notice: 'Fraction was successfully created.' }
        format.json { render :show, status: :created, location: @fraction }
      else
        format.html { render :new }
        format.json { render json: @fraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fractions/1
  # PATCH/PUT /fractions/1.json
  def update
    respond_to do |format|
      if @fraction.update(fraction_params)
        format.html { redirect_to @fraction, notice: 'Fraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @fraction }
      else
        format.html { render :edit }
        format.json { render json: @fraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fractions/1
  # DELETE /fractions/1.json
  def destroy
    @fraction.destroy
    respond_to do |format|
      format.html { redirect_to fractions_url, notice: 'Fraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fraction
      @fraction = Fraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraction_params
      params.require(:fraction).permit(:fraction)
    end
end
