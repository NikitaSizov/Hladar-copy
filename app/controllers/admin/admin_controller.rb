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

end
