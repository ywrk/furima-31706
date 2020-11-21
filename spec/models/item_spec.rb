require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能テストコード' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の出品' do
      context '出品がうまくいくとき' do
        it '出品には次の９点が存在すれば出品できる image, title, price, description, category_id, condition_id, shipping_from_id, shipping_fee_id, estimated_shipping_id' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it '商品画像がなければ出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        # title（商品名）についてのテスト
        it '商品名がなければ出品できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it '商品名が41文字以上では出品できない' do
          @item.title = Faker::Lorem.characters(number: 41)
          @item.valid?
          expect(@item.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
        end
        # description（商品の説明）についてのテスト
        it '商品の説明の記載があれば出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it '商品の説明の記載が1001文字以上では出品できない' do
          @item.description = Faker::Lorem.characters(number: 1001)
          @item.valid?
          expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
        end
        # category_id（商品カテゴリー）についてのテスト
        it '商品カテゴリーの情報がなければ出品できない' do 
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品カテゴリーがid１「--」を選択されている場合は出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        # condition_id（商品の状態）についてのテスト
        it '商品の状態についての情報がなければ出品できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it '商品の状態がid１「--」を選択されている場合は出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        # shipping_from_id（発送元の地域）についてのテスト
        it '発送元の地域についての情報がなければ出品できない' do
          @item.shipping_from_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping from can't be blank")
        end
        it '発送元の地域がid１「--」を選択されている場合は出品できない' do
          @item.shipping_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping from must be other than 1")
        end
        # shipping_fee_id（配送料の負担）についてのテスト
        it '配送料の負担についての情報がなければ出品できない' do
          @item.shipping_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end
        it '発送元の地域がid１「--」を選択されている場合は出品できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
        end
        # estimated_shipping_id（発送までの日数）についてのテスト
        it '発送までの日数についての情報がなければ出品できない' do
          @item.estimated_shipping_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
        end
        it '発送元の地域がid１「--」を選択されている場合は出品できない' do
          @item.estimated_shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Estimated shipping must be other than 1")
        end
        # price（商品価格）についてのテスト
        it '価格についての情報がなければ出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格について半角数字でなければ出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格について¥299以下では出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '価格について¥10,000,000以上では出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end
