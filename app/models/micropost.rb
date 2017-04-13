class Micropost < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3,  maximum: 1000 }
  validates :image, presence: true
  belongs_to :user
  has_many :comments, :dependent => :destroy
  mount_uploader :image, ImageUploader
  include PgSearch
  resourcify
  acts_as_taggable
  pg_search_scope :full_search,
                  :against => [
                      :content

                  ],
                  :associated_against => {
                      :user => [:login, :email],
                      :tags=>[:name]

                  }

end
