class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @totalReg = Category.all.count

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
      @categories = Category.first(@limit)
      #raise @providers.size.to_yaml
      @end = Category.page(@page).last_page? ? @start + @categories.size - 1  : @start + @limit -1
      return
    end
    
    @categories = Category.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @categories = Category.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @categories.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Category.page(@page).last_page? ? @start + @categories.size - 1  : @start + @limit -1
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)


    begin
      Category.transaction do # un ActiveRecord
        #@full_category.each do |f|
          #Category.create(f)
          #f.save!
        #end
        @category.save!
      end
      #Código de éxito
    rescue => e
      raise ActiveRecord::Rollback #Lanzamos el rollback de nuevo a saco
      #Seguimos con las acciones que queramos, como notificar, etc.
    end


    respond_to do |format|
      if @category.save
        format.html { redirect_to api_v1_category_path(@category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to api_v1_category_path(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
