module ApplicationHelper
  def admin?
    params[:controller].split("::").first=="Admin" || session[:authed] == 1
  end
end
