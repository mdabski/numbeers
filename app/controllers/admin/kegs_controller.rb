class Admin::KegsController < Admin::AdminController
  before_action :set_keg, only: [:show, :edit, :update, :destroy, :charge]

  # GET /kegs
  # GET /kegs.json
  def index
    @kegs = Keg.all
  end

  # GET /kegs/1
  # GET /kegs/1.json
  def show
  end

  # GET /kegs/new
  def new
    @keg = Keg.new
  end

  # GET /kegs/1/edit
  def edit
  end

  # POST /kegs
  # POST /kegs.json
  def create
    @keg = Keg.new(keg_params)

    respond_to do |format|
      if @keg.save
        format.html { redirect_to [:admin, @keg], notice: 'Keg was successfully created.' }
        format.json { render action: 'show', status: :created, location: @keg }
      else
        format.html { render action: 'new' }
        format.json { render json: @keg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kegs/1
  # PATCH/PUT /kegs/1.json
  def update
    respond_to do |format|
      if @keg.update(keg_params)
        format.html { redirect_to [:admin, @keg], notice: 'Keg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @keg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kegs/1
  # DELETE /kegs/1.json
  def destroy
    @keg.destroy
    respond_to do |format|
      format.html { redirect_to admin_kegs_url }
      format.json { head :no_content }
    end
  end
  
  def charge
    @keg.charge_users
    #Send a balance notice to all users who have an outstanding balance
    User.send_balance_notice
    
    redirect_to admin_records_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keg
      @keg = Keg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keg_params
      params.require(:keg).permit(:size, :price, :start_date, :end_date, :beer_id)
    end
end
