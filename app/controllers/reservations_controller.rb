class ReservationsController < ApplicationController
  # a faire method private before_action :find_user, only: [:create]
  # a faire method private before_action :find_offer, only: [:create]

  def new
    @reservation = Reservation.new
  end

  def create
    # pas encore tester
    # recupere l'offre en attente de la table
                      # @offer = Offer.find(params[:offer_id])
    # assigne variable d'instance reservation nouvelle reservation avec params
    # de la fonction privee reservation params
    @reservation = Reservation.new(reservation_params)
    # assigne la valeur de l'id correspondant a l'user
    @reservation.user = current_user
    # assigne la valeur de l'id correspondant a l'offre
   # @reservation.offer_id = @offer #ou @user
    # si enregistrer rediriger vers la show de la reservation
    # sinon remettre le form
    if @reservation.save!
      redirect_to reservation_path(@reservation), notice: "succefully"
    else
      render 'reservations/new'
    end
    # attente des routes pour le if save redirect
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    # voir si ya un s ou pas a offers
    redirect_to offer_path, notice: 'destroy succefully'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:event_adress, :start_time, :end_time, :status)
  end
end
