class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      with_options presence: true do
        VALID_PASSWORD_REGEX =/\A(?=.*?[a-zA-Z])(?=.*?[\d])\w{6,}\z/
        validates :nickname
        validates :password  , format: { with: VALID_PASSWORD_REGEX  , message: "半角6文字以上で英字と数字の両方を含めて設定してください"}
        validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で記入してください"}
        validates :last_name , format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で記入してください"}
        validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "全角カナで記入してください"}
        validates :last_name_kana , format: { with: /\A[ァ-ン]+\z/, message: "全角カナで記入してください"}
        validates :birthday
      end

      # validates :nickname, presence: true
      # validates :first_name, presence: true
      # validates :last_name , presence: true
      # validates :first_name_kana, presence: true
      # validates :last_name_kana , presence: true
      # validates :birthday , presence: true
      

      
         
end
