class SessionsController < ApplicationController
  def new
  end

  def create
    @session = Session.new(params[:session])
    if @session.save
      redirect_to root_url, notice: "You're logged in. Rant away!"
    else
      flash[:error] = "Wrong Username or Password."
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've logged out. (And hopefully cooled off)"
  end
end
