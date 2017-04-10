module SessionHelper

  def logged_in?
    if session[:account_id]
      session[:account_id]
    else
      nil
    end
  end

  def logged_in_id
    session[:account_id]
  end

end