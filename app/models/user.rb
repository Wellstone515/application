class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  attachment :image

  validates :name, length: {in: 2..20}
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :introduct, length: {maximum: 50}


end
