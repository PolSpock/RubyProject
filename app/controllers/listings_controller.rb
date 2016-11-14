class ListingsController < ApplicationController
  def index
    #
    @listings= Listing.all

    respond_to do |format|
        format.html
        format.json { render json: @listings.to_json }
      end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render:new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :picture, :price, :category_id)
    end
end
