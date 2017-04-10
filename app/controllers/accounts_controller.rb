class AccountsController < ApplicationController

  def new
     @account = Account.new
     render :new
   end

   def create
     @account = Account.new(account_params)
     if @account.save
       session[:account_id] = @account.id
       redirect_to teams_path
     else
       @errors = @account.errors.full_messages
       render :new
     end
   end

   private

   def account_params
     params.require(:account).permit(:password, :account_name, :account_email)
   end


end