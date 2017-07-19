class Api::V1::BirthdaysController < ApplicationController
  before_action :set_birthday, only: [:show, :edit, :update, :destroy]

  # GET /birthdays
  # GET /birthdays.json
  def index
    @totalReg = Birthday.all.count

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
      @birthdays = Birthday.first(@limit)
      #raise @providers.size.to_yaml
      @end = Birthday.page(@page).last_page? ? @start + @birthdays.size - 1  : @start + @limit -1
      return
    end
    
    @birthdays = Birthday.order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)

    if params[:findBy] || params[:findQuery]
      @birthdays = Birthday.where("#{@findBy} like ?", "%#{params[:findQuery]}%").order("#{@sortBy} #{@sortDirection}").page(@page).per(@limit)
      @totalReg = @birthdays.count
      @totalPage = @totalReg / @limit + (@totalReg % @limit != 0 ? 1 : 0)
      @start = ((@page-1) * @limit) +1
      #raise @provider.to_yaml
    end
    @end = Birthday.page(@page).last_page? ? @start + @birthdays.size - 1  : @start + @limit -1
  end

  # GET /birthdays/1
  # GET /birthdays/1.json
  def show
  end

  # GET /birthdays/new
  def new
    @birthday = Birthday.new
  end

  # GET /birthdays/1/edit
  def edit
  end

  # POST /birthdays
  # POST /birthdays.json
  def create
    @birthday = Birthday.new(birthday_params)

    respond_to do |format|
      if @birthday.save
        format.html { redirect_to @birthday, notice: 'Birthday was successfully created.' }
        format.json { render :show, status: :created, location: @birthday }
      else
        format.html { render :new }
        format.json { render json: @birthday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /birthdays/1
  # PATCH/PUT /birthdays/1.json
  def update
    respond_to do |format|
      if @birthday.update(birthday_params)
        format.html { redirect_to @birthday, notice: 'Birthday was successfully updated.' }
        format.json { render :show, status: :ok, location: @birthday }
      else
        format.html { render :edit }
        format.json { render json: @birthday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birthdays/1
  # DELETE /birthdays/1.json
  def destroy
    @birthday.destroy
    respond_to do |format|
      format.html { redirect_to birthdays_url, notice: 'Birthday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_birthday
      @birthday = Birthday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def birthday_params
      params.require(:birthday).permit(:customer_id, :calentar_id)
    end
end
