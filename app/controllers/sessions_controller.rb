class SessionsController < ApplicationController
  before_filter :save_login_state, :only => [:login, :try_login]

  def login
  end

  def try_login
     authorized_user = User.authenticate(params[:email], params[:login_password])
     respond_to do |format|
      if authorized_user
        session[:user_id] = authorized_user.id
        format.html { redirect_to root_path, notice: "Welcome Back #{authorized_user.name}" }
      else
        format.html { render 'login', notice: "Failed to Login, Please Try Again" }
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

end