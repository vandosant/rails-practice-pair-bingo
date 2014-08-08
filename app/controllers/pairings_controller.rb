class PairingsController < ApplicationController
  def new
    @pair = User.find(params[:user_id])
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.create!(pairing_params.merge({
                                                      user_id: params[:user_id],
                                                      pair_id: current_user.id
                                                    }))
    redirect_to root_path
  end

  private

  def pairing_params
    params.require(:pairing).permit(:pair_date)
  end
end