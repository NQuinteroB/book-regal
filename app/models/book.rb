class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_title_and_category,
    against: [ :title, :book_category, :language],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
