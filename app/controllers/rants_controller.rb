class RantsController < ApplicationController


  def index
    @rants = Rant.all
    @rant = Rant.new
  end

  def show
    @rant.content
  end

  def new
    @rant=Rant.new
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.user_id= current_user
    if @rant.save
        redirect_to root_path
    else
      flash[:alert]= "There has been a problem saving your rant! Sorry."
      render :new
    end
  end

  def update
    if @rant.update(rant_params)
      redirect_to root_path, [:alert] => 'Rant was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @rant.destroy
      redirect_to rants_path [:alert] => 'Rant was successfully deleted.'
  end

  private

  def set_rant
    @rant = Rant.find(params[:id])
    unless @rant.user == @current_user
      flash[:alert]= "You are not the creator of this rant!"
      redirect_to root_url
    end
  end

  def rant_params
    params.require(:rant).permit(:content, :user_id)
  end

end
