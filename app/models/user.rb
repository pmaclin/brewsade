class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #:validatable

  has_many :favorites
  has_many :beers, through: :favorites

  validates :email, presence: true, uniqueness: true

  def move_to(user)
    favorites.update_all(user_id: user.id)
  end
end
