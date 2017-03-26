class Micropost < ApplicationRecord
  validates :content, presence: true
  validates :image, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  include PgSearch
  pg_search_scope :search_everywhere, against: [:content]
  resourcify

end
