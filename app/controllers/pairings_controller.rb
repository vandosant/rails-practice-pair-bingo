class PairingsController < ApplicationController
  def new
    @pair = User.find(params[:user_id])
    @pairing = Pairing.new
  end

  def create
    @pair = User.find(params[:user_id])
    @pairing = Pairing.new(pairing_params.merge({
                                                  user_id: current_user.id,
                                                  pair_id: @pair.id
                                                }))
    if @pairing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pairing_params
    params.require(:pairing).permit(:pair_date)
  end
end