class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_nav
  before_action :check_auth, except: [:login, :auth]

  def check_auth
    redirect_to :admin_login if admin? && !authed?
  end

  def get_nav
    if admin? then
      @nav = [
        {name: "Главная", link: "/admin"},
        {name: "Сертификаты", link: admin_sertificates_url},
        {name: "Новости", link: ""},
        {name: "Продукция", link: admin_products_url},
        {name: "Заказы", link: admin_orders_url}
      ]
    else
      @nav = [
        {name: "Главная", link: root_url},
        {name: "Продукция", link: products_url},
        {name: "О Нас", link: "/#what-we-make"},
        {name: "Контакты", link: "/#contacts"},
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
end
