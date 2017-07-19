class Api::V1::PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # GET /phones
  # GET /phones.json
  def index
    @totalReg = Phone.all.count

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
      @phones = Phone.first(@limit)
      #raise @providers.size.to_yaml
      @end = Phone.page(@page).last_page? ? @start + @phones.size - 1  : @start + @limit -1
      return
    end
    
    @phones = Phone.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @phones = Phone.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @phones.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Phone.page(@page).last_page? ? @start + @phones.size - 1  : @start + @limit -1
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to @phone, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to @phone, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:phone, :pe, :provider_id)
    end
end
