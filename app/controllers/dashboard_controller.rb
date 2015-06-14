class DashboardController < ApplicationController

  before_action :logged_in?, only: :home

  def home

  end

  def login
    if request.post?
      set_author(params[:email])
      if @author && @author.authenticate(params[:password])
        session[:author_id] = @author.id
        redirect_to root_path, notice: "Login Successful."
      else
        flash.now[:notice] = "Invalid Login. Please Try Again."
      end
    end
  end

  def logout
    session[:author_id] = nil
    redirect_to login_path, notice: "Logout Successful."
  end

  def signup
    redirect_to new_author_path
  end

end
