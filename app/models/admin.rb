class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user
  has_many :blog

  def self.search(search)
    if search
      User.where(User.arel_table[:username].matches("%#{search}%"))
    else
      User.all
    end
  end
end
