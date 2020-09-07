class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :tracks, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :phone_number, presence: true, length: { maximum: 11 }
  paginates_per 12

  attachment :profile_image

  def self.search(search)
    if search
      User.where(User.arel_table[:username].matches("%#{search}%"))
    else
      User.all
    end
  end

  def active_for_authentication?#論理削除
    super && (self.flag == false)
  end

  def already_favorited?(blog)
    self.favorites.exists?(blog_id: blog.id)
  end
end
