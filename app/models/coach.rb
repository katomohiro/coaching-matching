class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :thumbnail, ImageUploader

  scope :where_like_name, ->(name) { where('name like ?', "%#{name}%") if name.present? }
  scope :where_like_nickname, ->(nickname) { where('nickname like ?', "%#{nickname}%") if nickname.present? }
end
