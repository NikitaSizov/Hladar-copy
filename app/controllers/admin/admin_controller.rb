class Admin::AdminController < ApplicationController
  include ApplicationHelper

  def admin
    render html:"admin"
  end
end
