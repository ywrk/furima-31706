class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      with_options presence: true do
      validates :nickname
      validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で記入してください"}
      validates :last_name , format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で記入してください"}
      validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "全角カナで記入してください"}
      validates :last_name_kana , format: { with: /\A[ァ-ン]+\z/, message: "全角カナで記入してください"}
      validates :birthday
      end
      
         
end
