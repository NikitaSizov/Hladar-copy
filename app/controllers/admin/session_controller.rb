class Admin::SessionController < ApplicationController
  def login

  end
  def auth
    if params[:email]=="me@not.me" && params[:password]=="123"
      session[:authed] = 1
      flash[:notice] = "Авторизовано"
      redirect_to admin_root_path
    else
      session[:authed] = 0
      flash[:error] = "Неправильно введены логин/пароль"
      redirect_to admin_login_path
    end
  end
end
