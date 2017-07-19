class Api::V1::AtpStocksController < ApplicationController
  before_action :set_atp_stock, only: [:show, :edit, :update, :destroy]

  # GET /atp_stocks
  # GET /atp_stocks.json
  def index
    @totalReg = AtpStock.all.count

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
      @atp_stocks = AtpStock.first(@limit)
      #raise @providers.size.to_yaml
      @end = AtpStock.page(@page).last_page? ? @start + @atp_stocks.size - 1  : @start + @limit -1
      return
    end
    
    @atp_stocks = AtpStock.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @atp_stocks = AtpStock.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @atp_stocks.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = AtpStock.page(@page).last_page? ? @start + @atp_stocks.size - 1  : @start + @limit -1
  end

  # GET /atp_stocks/1
  # GET /atp_stocks/1.json
  def show
  end

  # GET /atp_stocks/new
  def new
    @atp_stock = AtpStock.new
  end

  # GET /atp_stocks/1/edit
  def edit
  end

  # POST /atp_stocks
  # POST /atp_stocks.json
  def create
    @atp_stock = AtpStock.new(atp_stock_params)

    respond_to do |format|
      if @atp_stock.save
        format.html { redirect_to @atp_stock, notice: 'Atp stock was successfully created.' }
        format.json { render :show, status: :created, location: @atp_stock }
      else
        format.html { render :new }
        format.json { render json: @atp_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atp_stocks/1
  # PATCH/PUT /atp_stocks/1.json
  def update
    respond_to do |format|
      if @atp_stock.update(atp_stock_params)
        format.html { redirect_to @atp_stock, notice: 'Atp stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @atp_stock }
      else
        format.html { render :edit }
        format.json { render json: @atp_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atp_stocks/1
  # DELETE /atp_stocks/1.json
  def destroy
    @atp_stock.destroy
    respond_to do |format|
      format.html { redirect_to atp_stocks_url, notice: 'Atp stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atp_stock
      @atp_stock = AtpStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atp_stock_params
      params.require(:atp_stock).permit(:min_stock, :max_stock, :product_id)
    end
end
