module ApplicationHelper
  def admin?
    #Rails.logger.debug request.original_fullpath.split("/")[1]
    request.original_fullpath.split("/")[1]=="admin"
  end
  def authed?
    session[:authed] == 1
  end
end
