class Api::V1::PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  
  def addPackaging
    product_params = params.require(:product).permit(:name, :description, :url_image, :bar_code, :flag, :suggested_price, :category_id, :unity_id)
    @product = Product.new(product_params)
    @product_supra = Product.find(params[:product_id])
    @fraction = params[:fraction]
    #raise @product_supra.inspect.to_yaml
    
    respond_to do |format|
      if @product.save
        ActiveRecord::Base.connection.execute("call packaging(#{@product_supra.id},#{@product.id},#{@fraction})")
        format.html { redirect_to api_v1_product_path(params[:product_id]), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /packages
  # GET /packages.json
  def index
    @totalReg = Package.all.count

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
      @packages = Package.first(@limit)
      #raise @providers.size.to_yaml
      @end = Package.page(@page).last_page? ? @start + @packages.size - 1  : @start + @limit -1
      return
    end
    
    @packages = Package.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @packages = Package.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @packages.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Package.page(@page).last_page? ? @start + @packages.size - 1  : @start + @limit -1
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:id_sub)
    end
end
