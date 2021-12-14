class ReservationsController < ApplicationController
  # a faire method private before_action :find_user, only: [:create]
  # a faire method private before_action :find_offer, only: [:create]

  def new
    @reservation = Reservation.new
    @user = current_user
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.offer = @offer
    if @reservation.save!
      redirect_to reservation_path(@reservation), notice: "creation success"
    else
      render 'reservations/new'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to offers_path, notice: 'destroy successfully'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:event_adress, :start_time, :end_time)
  end
end
