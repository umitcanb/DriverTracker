class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy, :save_checkin, :checkin, :see_worked_hours]


  def checkin
    if current_driver != @driver 
      respond_to do |format|
        format.html { redirect_to @driver, notice: 'You can only check in for yourself' }
      end
    end
    
    #redirects to the html template in which the driver indicates the hours worked
  end 

  def save_checkin
    if @driver.check_ins.create(date: Date.today, hours: params[:hours]) 
      redirect_to drivers_path, notice: 'Checked-in.'
    else
      redirect_to drivers_path, notice: 'Something went wrong.'
    end
  end 

  def see_worked_hours
    @workedHours = @driver.calculateWorkedHoursOfLastWeek
   # directly from controller:  @workedHours = @driver.check_ins.where("date>=?", 7.days.ago).sum(:hours)

  end

  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
    if current_driver != @driver
      respond_to do |format|
        format.html { redirect_to @driver, notice: 'You can edit only your information ' }
      end
    end
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_driver.admin == true
      @driver.destroy
      respond_to do |format2|
        format2.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
        format2.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:name, :surname, :email, :city)
    end
end
