class PairingsController < ApplicationController
  def new
    @pair = User.find(params[:user_id])
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.new(pairing_params.merge({
                                                  user_id: params[:user_id],
                                                  pair_id: current_user.id
                                                }))
    if @pairing.save
      redirect_to root_path
    else
      @pair = User.find(params[:user_id])
      render :new
    end
  end

  private

  def pairing_params
    params.require(:pairing).permit(:pair_date)
  end
end