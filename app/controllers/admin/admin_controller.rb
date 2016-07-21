class Admin::AdminController < ApplicationController
  include ApplicationHelper

  def admin
    redirect_to admin_orders_url
  end

  def imgupload
    path = uploadfile(params[:file])
    respond_to do |format|
      format.json { render json: {filelink: path}, status: :created }
    end
  end

end
