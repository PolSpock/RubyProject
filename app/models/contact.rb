class Contact < ApplicationRecord

  belongs_to :listing
  belongs_to :user

  def self.generate(params, user)
    Contact.create(
      user_id: user.id,
      listing_id: params[:listing_id],
      message: params[:message]
    )

    UserMailer.new_contact(params[:listing_id], user.email, params[:message]).deliver_now
  end

  def self.seller_contacts_for(user_id)
    Contact.joins('LEFT JOIN listings on contacts.listing_id = listings.id')
      .where(['listings.user_id = ?', user_id])
      .order('contacts.created_at DESC')
  end

  def self.buyer_messages_from(user_id)
    Contact.where(['user_id = ?', user_id]).order('contacts.created_at DESC')
  end

end
