class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offers_path
    else
      render 'new'
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :availability, :location, :price_per_hour, :offer_description, :santa_description)
  end
end
