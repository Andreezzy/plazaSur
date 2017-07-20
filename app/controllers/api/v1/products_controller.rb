class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @totalReg = Product.all.count

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
      @products = Product.first(@limit)
      #raise @providers.size.to_yaml
      @end = Product.page(@page).last_page? ? @start + @products.size - 1  : @start + @limit -1
      return
    end
    
    @products = Product.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @products = Product.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @products.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Product.page(@page).last_page? ? @start + @products.size - 1  : @start + @limit -1

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @category = @product.category
    @unity = @product.unity
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to api_v1_product_path(@product), notice: 'Product was successfully created.' }
        
        msg = { :status => 201, :message => "ok", result: { id: @product.id } }
        format.json  { render :json => msg }
      else
        format.html { render :new }

        msg = { status: :unprocessable_entity, :message => "Error al crear producto", errors: @product.errors }
        format.json  { render :json => msg }

      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to api_v1_product_path(@product), notice: 'Product was successfully updated.' }

        msg = { :status => 200, :message => "ok", result: { id: @product.id } }
        format.json  { render :json => msg }


        #format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @id = @product.id
    @product.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_products_path, notice: 'Product was successfully destroyed.' }

      msg = { :status => 200, :message => "ok", result: { id: @id } }
      format.json  { render :json => msg }

      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :url_image, :bar_code, :flag, :suggested_price, :category_id, :unity_id)
    end
end
