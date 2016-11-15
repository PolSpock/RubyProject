class Contact < ApplicationRecord

  belongs_to :category
  belongs_to :user

  def self.generate(params, user)
    Contact.create(
      user_id: user.id,
      listing_id: params[:listing_id],
      message: params[:message]
    )

    UserMailer.new_contact(params[:listing_id], user.email, params[:message]).deliver_now
  end

end
