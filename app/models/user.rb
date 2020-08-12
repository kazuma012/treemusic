class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :sub_last_name, presence: true
  validates :sub_first_name, presence: true
  validates :phone_number, presence: true, length: { maximum: 11 }
  def active_for_authentication?#論理削除
    super && (self.flag == false)
  end
end
