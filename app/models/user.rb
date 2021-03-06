class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :login, presence: true
  validates :full_name, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zip, presence: true
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :microposts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  after_create :add_default_role

  def add_default_role
    self.add_role(:user)
  end


end