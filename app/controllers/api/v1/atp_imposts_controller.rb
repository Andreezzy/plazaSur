class Api::V1::AtpImpostsController < ApplicationController
  before_action :set_atp_impost, only: [:show, :edit, :update, :destroy]

  # GET /atp_imposts
  # GET /atp_imposts.json
  def index
    @totalReg = AtpImpost.all.count

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
      @atp_imposts = AtpImpost.first(@limit)
      #raise @providers.size.to_yaml
      @end = AtpImpost.page(@page).last_page? ? @start + @atp_imposts.size - 1  : @start + @limit -1
      return
    end
    
    @atp_imposts = AtpImpost.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @atp_imposts = AtpImpost.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @atp_imposts.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = AtpImpost.page(@page).last_page? ? @start + @atp_imposts.size - 1  : @start + @limit -1
  end

  # GET /atp_imposts/1
  # GET /atp_imposts/1.json
  def show
  end

  # GET /atp_imposts/new
  def new
    @atp_impost = AtpImpost.new
  end

  # GET /atp_imposts/1/edit
  def edit
  end

  # POST /atp_imposts
  # POST /atp_imposts.json
  def create
    @atp_impost = AtpImpost.new(atp_impost_params)

    respond_to do |format|
      if @atp_impost.save
        format.html { redirect_to @atp_impost, notice: 'Atp impost was successfully created.' }
        format.json { render :show, status: :created, location: @atp_impost }
      else
        format.html { render :new }
        format.json { render json: @atp_impost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atp_imposts/1
  # PATCH/PUT /atp_imposts/1.json
  def update
    respond_to do |format|
      if @atp_impost.update(atp_impost_params)
        format.html { redirect_to @atp_impost, notice: 'Atp impost was successfully updated.' }
        format.json { render :show, status: :ok, location: @atp_impost }
      else
        format.html { render :edit }
        format.json { render json: @atp_impost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atp_imposts/1
  # DELETE /atp_imposts/1.json
  def destroy
    @atp_impost.destroy
    respond_to do |format|
      format.html { redirect_to atp_imposts_url, notice: 'Atp impost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atp_impost
      @atp_impost = AtpImpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atp_impost_params
      params.require(:atp_impost).permit(:impost, :product_id)
    end
end
