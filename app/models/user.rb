class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :date_of_birth, presence: true
end
