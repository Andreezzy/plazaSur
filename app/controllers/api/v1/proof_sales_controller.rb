class Api::V1::ProofSalesController < ApplicationController
  before_action :set_proof_sale, only: [:show, :edit, :update, :destroy]

  # GET /proof_sales
  # GET /proof_sales.json
  def index
    @totalReg = ProofSale.all.count

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
      @proof_sales = ProofSale.first(@limit)
      #raise @providers.size.to_yaml
      @end = ProofSale.page(@page).last_page? ? @start + @proof_sales.size - 1  : @start + @limit -1
      return
    end
    
    @proof_sales = ProofSale.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @proof_sales = ProofSale.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @proof_sales.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = ProofSale.page(@page).last_page? ? @start + @proof_sales.size - 1  : @start + @limit -1
  end

  # GET /proof_sales/1
  # GET /proof_sales/1.json
  def show
  end

  # GET /proof_sales/new
  def new
    @proof_sale = ProofSale.new
  end

  # GET /proof_sales/1/edit
  def edit
  end

  # POST /proof_sales
  # POST /proof_sales.json
  def create
    @proof_sale = ProofSale.new(proof_sale_params)

    respond_to do |format|
      if @proof_sale.save
        format.html { redirect_to @proof_sale, notice: 'Proof sale was successfully created.' }
        format.json { render :show, status: :created, location: @proof_sale }
      else
        format.html { render :new }
        format.json { render json: @proof_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proof_sales/1
  # PATCH/PUT /proof_sales/1.json
  def update
    respond_to do |format|
      if @proof_sale.update(proof_sale_params)
        format.html { redirect_to @proof_sale, notice: 'Proof sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @proof_sale }
      else
        format.html { render :edit }
        format.json { render json: @proof_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proof_sales/1
  # DELETE /proof_sales/1.json
  def destroy
    @proof_sale.destroy
    respond_to do |format|
      format.html { redirect_to proof_sales_url, notice: 'Proof sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proof_sale
      @proof_sale = ProofSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proof_sale_params
      params.require(:proof_sale).permit(:sale_id, :product_id, :quantity, :total_price, :user_id, :commentary)
    end
end
