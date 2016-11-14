class Listing < ApplicationRecord
  mount_uploader :picture, AvatarUploader

  belongs_to :category

#  validates_presence_of :price
#  validate :price_is_valid

#  private
#  def price_is_valid
#    if price
#      if price > 0.0
#        return
end
