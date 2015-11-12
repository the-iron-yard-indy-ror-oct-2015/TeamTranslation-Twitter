class RantsController < ApplicationController
  def create
    @rant = Rant.new(params[:rant])
    @rant.user_id= current_user.id

    if @rant.save
        redirect_to current_user
    else
      flash[:alert]= "There has been a problem saving your rant! Sorry."
      redirect_to current_user
    end
  end
  
end
