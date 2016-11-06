class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_nav
  before_action :check_auth, except: [:login, :auth]
  before_action :set_locale

  def check_auth
    redirect_to :admin_login if admin? && !authed?
  end

  def get_nav
    if admin? then
      @nav = [
        #{name: "Главная", link: "/admin"},
        {name: "Сертификаты", link: admin_sertificates_path},
        {name: "Новости", link: admin_news_index_path},
        {name: "Продукция", link: admin_products_path},
        {name: "Категории", link: admin_categories_path},
        {name: "Заказы", link: admin_orders_path}
      ]
    else
      @nav = [
        {name: t('nav.main'), link: root_path},
        {name: t('nav.production'), link: products_path},
        {name: t('nav.about'), link: "/#what-we-make"},
        {name: t('nav.contacts'), link: "/#contacts"},
      ]
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
  def set_locale
    session[:locale] = params[:locale] if params[:locale].present?
    I18n.locale = session[:locale] if session[:locale].present?
  end
end
