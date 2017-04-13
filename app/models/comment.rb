class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  resourcify
  validates :body, length: { minimum: 3,  maximum: 140 }
end
