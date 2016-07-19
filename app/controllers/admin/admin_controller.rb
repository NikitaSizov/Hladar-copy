class Admin::AdminController < ApplicationController
  include ApplicationHelper
  before_action :check_auth, except: [:login, :auth]

  def check_auth
    redirect_to :admin_login unless admin? || authed?
  end

  def admin
    render html:"admin"
  end
end
