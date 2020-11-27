require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '商品購入機能テストコード' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    describe '商品の購入' do
      context '購入がうまくいく場合' do
        it '購入には次の7点とトークンが存在すれば購入できる post_code,prefecture_id,city,address,phone_number,user_id, item_id' do
          expect(@user_buy).to be_valid
        end
      end

      context '購入がうまくいかない場合' do
        it '郵便番号が空欄の場合' do
          @user_buy.post_code = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Post code can't be blank")
        end
        it '郵便番号にハイフンがない場合' do
          @user_buy.post_code = "1112222"
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Post code is invalid. Include hyphen(-).Input herf-width numbers.")
        end
        it '郵便番号が全角の場合' do
          @user_buy.post_code = "１１１-２２２２"
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Post code is invalid. Include hyphen(-).Input herf-width numbers.")
        end

        it '都道府県がid１「--」を選択されている場合' do
          @user_buy.prefecture_id = 1
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it '市町村が空白の場合' do
          @user_buy.city = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空白の場合' do
          @user_buy.address = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空白の場合' do
          @user_buy.phone_number = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が半角数字ではない場合' do
          @user_buy.phone_number = "０００１１１１２２２２"
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Phone number is invalid. Input herf-width numbers")
        end
         it '電話番号が12桁以上の場合' do
          @user_buy.phone_number = "000111122229"
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end
        
         it 'use_idが空欄の場合' do
          @user_buy.user_id = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("User can't be blank")
        end

         it 'item_idが空欄の場合' do
          @user_buy.item_id = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Item can't be blank")
        end

         it 'トークンが空欄の場合' do
          @user_buy.token = ""
          @user_buy.valid?
          expect(@user_buy.errors.full_messages).to include("Token can't be blank")
        end

        

      end

    end
  end
end


