class Admin::SertificatesController < ApplicationController
  before_action :set_admin_sertificate, only: [:show, :edit, :update, :destroy]

  # GET /admin/sertificates
  # GET /admin/sertificates.json
  def index
    @sertificates = Sertificate.all
  end

  # GET /admin/sertificates/new
  def new
    @sertificate = Sertificate.new
    render layout: false if params[:no_layout]
  end

  # GET /admin/sertificates/1/edit
  def edit
    render layout: false if params[:no_layout]
  end

  # POST /admin/sertificates
  # POST /admin/sertificates.json
  def create
    data = admin_sertificate_params
    data[:image] =  uploadfile(params[:sertificate][:image]) if params[:sertificate][:image]
    @sertificate = Sertificate.new(data)

    respond_to do |format|
      if @sertificate.save
        format.html { redirect_to admin_sertificates_url, notice: 'Sertificate was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @sertificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sertificates/1
  # PATCH/PUT /admin/sertificates/1.json
  def update
    data = admin_sertificate_params
    if params[:sertificate][:image] then
      old_filename = Rails.root.join("public", "images", @sertificate.image)
      File.delete(old_filename) if File.exist? old_filename
      data[:image]  = uploadfile(params[:sertificate][:image])
    end
    respond_to do |format|
      if @sertificate.update(data)
        format.html { redirect_to admin_sertificates_url, notice: 'Sertificate was successfully updated.' }
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
      params.require(:sertificate).permit(:name, :image)
    end
end
