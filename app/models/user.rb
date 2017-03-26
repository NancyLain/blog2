class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :login, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :microposts
  has_many :comments

end
