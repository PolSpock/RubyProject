class ListingsController < ApplicationController
  def index
    # SELECT * FORM LISTINGS WHERE TITLE ILIKE '%keyword%'

    @listings = Listing.search(params)

  end

  def contact
    Contact.generate(params, current_user)

    render nothing: true
  end

  def new
    redirect_to new_user_session_path unless current_user
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
      # INJECTION DE DEPENDANCE
      params.require(:listing).permit(:title, :description, :picture, :price, :category_id).merge(user_id: current_user.id)
    end
end
