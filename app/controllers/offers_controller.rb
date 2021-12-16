class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'new'
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def dashboard
    @offers = Offer.where(user_id: current_user)
    @reservations = Reservation.where(user_id: current_user)
  end

  def destroy
    @offer = Offer.find(params[:id])
    puts 'success destroy -_-'
    @offer.destroy
    redirect_to dashboard_offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :availability, :location, :price_per_hour, :offer_description,
                                  :santa_description, :photo)
  end
end
