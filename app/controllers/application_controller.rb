class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_nav

  def get_nav
    if admin? then
      @nav = [
        {name: "Главная", link: ""}, #admin_main_url},
        {name: "Сертификаты", link: ""},
        {name: "Новости", link: ""},
        {name: "Продукция", link: ""},#admin_products_url},
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
end
