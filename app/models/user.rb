class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  belongs_to :country, optional: true
  belongs_to :language, optional: true

  has_many :work_experiences, dependent: :destroy
  has_many :interests_users, dependent: :destroy
  has_many :interests, through: :interests_users

  enum gender: { female: 0, male: 1 }

  validates :first_name,
            :last_name,
            :email,
            presence: true

  validates :email,
            uniqueness: true,
            email: true

end
