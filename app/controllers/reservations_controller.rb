class ReservationsController < ApplicationController
  # a faire method private before_action :find_user, only: [:create]
  # a faire method private before_action :find_offer, only: [:create]

  def new
    @reservation = Reservation.new
  end

  def create
    # pas encore tester
    # recupere l'user
    @user = User.find(params[:user_id])
    # recupere l'offre
    @offer = Offer.find(params[:offer_id])
    # assigne variable d'instance reservation nouvelle reservation avec params
    # de la fonction privee reservation params
    @reservation = Reservation.new(reservation_params)
    # assigne la valeur de l'id correspondant a l'user
    @reservation.user_id = @user
    # assigne la valeur de l'id correspondant a l'offre
    @reservation.offer_id = @offer
    # enregistre
    @reservation.save!
    # attente des routes pour le if save redirect
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
