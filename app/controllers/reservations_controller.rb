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
      redirect_to dashboard_offers_path, notice: "creation success"
    else
      render 'reservations/new'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @offer = Offer.find(@reservation.offer_id)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to dashboard_offers_path, notice: 'destroy successfully'
  end

  def accept_status
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.status = "accepted"
    @reservation.save!
    redirect_to dashboard_offers_path, notice: "reservation accepted"
  end

  def reject_status
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.status = "rejected"
    @reservation.save!
    redirect_to dashboard_offers_path, notice: "reservation rejected"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:event_adress, :reservation_start, :reservation_end)
  end

end
