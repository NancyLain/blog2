class Micropost < ApplicationRecord
  validates :content, presence: true
  validates :image, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  include PgSearch
  resourcify
  pg_search_scope :full_search,
                  :against => [
                      :content
                  ],
                  :associated_against => {
                      :user => [:login, :email]
                  }

end
