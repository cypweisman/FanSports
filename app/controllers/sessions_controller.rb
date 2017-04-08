class SessionsController < ApplicationController

    def new
      session[:account_id] = nil
    end

     def create
      account = Account.find_by_account_name(params[:account_name])
      if account && account.authenticate(params[:password])
        session[:account_id] = account.id
        redirect_to teams_path
      else
        render "new"
      end
    end

    def destroy
      session[:account_id] = nil
      redirect_to new_session_path
    end

end