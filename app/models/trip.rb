class Trip < ApplicationRecord
    has_one_attached :image
    belongs_to :customer
    has_many :comments, dependent: :destroy

    has_many :favorites, dependent: :destroy

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
    end
end
