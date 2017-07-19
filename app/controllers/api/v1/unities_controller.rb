class Api::V1::UnitiesController < ApplicationController
  before_action :set_unity, only: [:show, :edit, :update, :destroy]

  # GET /unities
  # GET /unities.json
  def index
    @totalReg = Unity.all.count

    @limit = params.has_key?(:limit) ? params[:limit].to_i : 10
    @page = params.has_key?(:page) ? params[:page].to_i : 1

    @status = 200
    @msg = "ok"

    @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)

    @start = ((@page-1) * @limit) +1
    

    @sortDirection = params.has_key?(:sortDirection) && params[:sortDirection] == 'ascending' ? 'ASC' : 'DESC'
    @sortBy = params.has_key?(:sortBy) ? params[:sortBy] : 'unity'
    @findBy = params.has_key?(:findBy) ? params[:findBy] : 'unity'


    if !params.has_key?(:limit) && !params.has_key?(:page) && !params.has_key?(:findQuery)
      @unities = Unity.first(@limit)
      #raise @providers.size.to_yaml
      @end = Unity.page(@page).last_page? ? @start + @unities.size - 1  : @start + @limit -1
      return
    end
    
    @unities = Unity.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @unities = Unity.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @unities.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Unity.page(@page).last_page? ? @start + @unities.size - 1  : @start + @limit -1
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
