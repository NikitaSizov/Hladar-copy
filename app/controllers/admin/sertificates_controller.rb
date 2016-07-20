class Admin::SertificatesController < ApplicationController
  before_action :set_admin_sertificate, only: [:show, :edit, :update, :destroy]

  # GET /admin/sertificates
  # GET /admin/sertificates.json
  def index
    @sertificates = Sertificate.all
  end

  # GET /admin/sertificates/1
  # GET /admin/sertificates/1.json
  def show
  end

  # GET /admin/sertificates/new
  def new
    @sertificate = Sertificate.new
  end

  # GET /admin/sertificates/1/edit
  def edit
  end

  # POST /admin/sertificates
  # POST /admin/sertificates.json
  def create
    @sertificate = Sertificate.new(admin_sertificate_params)

    respond_to do |format|
      if @admin_sertificate.save
        format.html { redirect_to @sertificate, notice: 'Sertificate was successfully created.' }
        format.json { render :show, status: :created, location: @sertificate }
      else
        format.html { render :new }
        format.json { render json: @sertificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sertificates/1
  # PATCH/PUT /admin/sertificates/1.json
  def update
    respond_to do |format|
      if @sertificate.update(admin_sertificate_params)
        format.html { redirect_to @sertificate, notice: 'Sertificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @sertificate }
      else
        format.html { render :edit }
        format.json { render json: @sertificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sertificates/1
  # DELETE /admin/sertificates/1.json
  def destroy
    @sertificate.destroy
    respond_to do |format|
      format.html { redirect_to admin_sertificates_url, notice: 'Sertificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_sertificate
      @sertificate = Sertificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_sertificate_params
      params.require(:admin_sertificate).permit(:name, :image)
    end
end
