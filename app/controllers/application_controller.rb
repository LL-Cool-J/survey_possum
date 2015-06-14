class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:author_id] ? true : (redirect_to login_path, notice: "Please Login.")
  end

  def set_author(email)
    if Author.find_by_email(email)
      @author = Author.find_by_email(email)
    else
      return false
    end
  end

end
