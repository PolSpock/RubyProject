class Listing < ApplicationRecord
  mount_uploader :picture, AvatarUploader

  has_many :Contacts
  belongs_to :category
  belongs_to :user

  def self.search(params)
    if params[:category_id]
      @listings = Listing.where(["category_id = ?", params[:category_id]])
    else
      @listings = Listing.where("title ILIKE :query", query: "%#{params[:keywords]}%")
    end
  end

#  validates_presence_of :price
#  validate :price_is_valid

#  private
#  def price_is_valid
#    if price
#      if price > 0.0
#        return
end
