class Api::V1::PromotionHasProductsController < ApplicationController
  before_action :set_promotion_has_product, only: [:show, :edit, :update, :destroy]

  # GET /promotion_has_products
  # GET /promotion_has_products.json
  def index
    @totalReg = PromotionHasProduct.all.count

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
      @promotion_has_products = PromotionHasProduct.first(@limit)
      #raise @providers.size.to_yaml
      @end = PromotionHasProduct.page(@page).last_page? ? @start + @promotion_has_products.size - 1  : @start + @limit -1
      return
    end
    
    @promotion_has_products = PromotionHasProduct.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @promotion_has_products = PromotionHasProduct.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @promotion_has_products.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = PromotionHasProduct.page(@page).last_page? ? @start + @promotion_has_products.size - 1  : @start + @limit -1
  end

  # GET /promotion_has_products/1
  # GET /promotion_has_products/1.json
  def show
  end

  # GET /promotion_has_products/new
  def new
    @promotion_has_product = PromotionHasProduct.new
  end

  # GET /promotion_has_products/1/edit
  def edit
  end

  # POST /promotion_has_products
  # POST /promotion_has_products.json
  def create
    @promotion_has_product = PromotionHasProduct.new(promotion_has_product_params)

    respond_to do |format|
      if @promotion_has_product.save
        format.html { redirect_to @promotion_has_product, notice: 'Promotion has product was successfully created.' }
        format.json { render :show, status: :created, location: @promotion_has_product }
      else
        format.html { render :new }
        format.json { render json: @promotion_has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotion_has_products/1
  # PATCH/PUT /promotion_has_products/1.json
  def update
    respond_to do |format|
      if @promotion_has_product.update(promotion_has_product_params)
        format.html { redirect_to @promotion_has_product, notice: 'Promotion has product was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotion_has_product }
      else
        format.html { render :edit }
        format.json { render json: @promotion_has_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotion_has_products/1
  # DELETE /promotion_has_products/1.json
  def destroy
    @promotion_has_product.destroy
    respond_to do |format|
      format.html { redirect_to promotion_has_products_url, notice: 'Promotion has product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion_has_product
      @promotion_has_product = PromotionHasProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_has_product_params
      params.require(:promotion_has_product).permit(:promotion_id, :product_id)
    end
end
