class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to "/events"
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  private
    def def user_params
      params.require(:user).permit(:email, :password)

    end
end
