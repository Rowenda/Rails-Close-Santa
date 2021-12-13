class ReservationsController < ApplicationController
 # a faire method private before_action :find_user, only: [:create]
 # a faire method private before_action :find_offer, only: [:create]

  def new
    @reservation = Reservation.new
  end

  def create #pas tester
    @user = User.find(params[:user_id])
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @user
    @reservation.offer_id = @offer
    @reservation.save!
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
   # a rediriger redirect_to ''
  end

  private

  def reservation_params
    params.require(:reservation).permit(:event_adress, :start_time, :end_time, :status)
  end
end
