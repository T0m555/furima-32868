class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do
    validates :nickname, :birthday
    validates :first_name, :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :first_kana, :last_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end
  has_many :items
end