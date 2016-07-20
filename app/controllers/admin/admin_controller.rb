class Admin::AdminController < ApplicationController
  include ApplicationHelper

  def admin
    render html:"admin"
  end

  def imgupload
    path = uploadfile(params[:file])
    respond_to do |format|
      format.json { render json: {filelink: path}, status: :created }
    end
  end

  private

  def uploadfile(uploaded_io)
    digest = Digest::MD5.hexdigest(Time.now.to_s)
    ext = uploaded_io.original_filename.split('.').last
    path = Rails.root.join('public', "images", digest + "." + ext)
    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    path.to_s.gsub(Rails.root.join('public', 'images').to_s,"")
  end

end
