class ComplainsController < ApplicationController
  before_action :set_complain, only: [:show, :edit, :update, :destroy]

  # GET /complains
  # GET /complains.json
  def index
    @complains = Complain.all
  end

  # GET /complains/new
  def new
    @complain = Complain.new
  end

  # POST /complains
  # POST /complains.json
  def create
    if verify_rucaptcha?
      @complain = Complain.new(complain_params)
  
      respond_to do |format|
        if @complain.save
          format.html { redirect_to complain_success_path, notice: 'Complain was successfully created.' }
          format.json { render :show, status: :created, location: @complain }
        else
          format.html { render :new }
          format.json { render json: @complain.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/complains/new', notice: '验证码错误'
    end
  end
  
  #success page
  def success
  end

  # DELETE /complains/1
  # DELETE /complains/1.json
  def destroy
    @complain.destroy
    respond_to do |format|
      format.html { redirect_to complains_url, notice: 'Complain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complain
      @complain = Complain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complain_params
      params.require(:complain).permit(:name, :email, :phonenumber, :solved, :text)
    end
end
