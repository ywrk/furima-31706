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
        it '商品画像が１枚ついていれば出品できる'do
          @item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
          expect(@item).to be_valid
        end
        it '商品名があれば出品できる' do
          @item.title = Faker::Lorem.characters(number: 10)
          expect(@item).to be_valid
        end
        it '商品の説明の記載があれば出品できる' do
          @item.description = Faker::Lorem.sentence(50)
          expect(@item).to be_valid
        end
        it '商品カテゴリーの情報があれば出品できる' do
          @item.category_id = '2' 
          expect(@item).to be_valid
        end
        it '商品の状態についての情報があれば出品できる' do
          @item.condition_id = '2' 
          expect(@item).to be_valid
        end
        it '発送元の地域についての情報があれば出品できる' do
          @item.shipping_from_id = '2' 
          expect(@item).to be_valid
        end
        it '配送料の負担についての情報があれば出品できる' do
          @item.shipping_fee_id = '2' 
          expect(@item).to be_valid
        end
        it '発送までの日数についての情報があれば出品できる' do
          @item.estimated_shipping_id = '2' 
          expect(@item).to be_valid
        end
        it '価格について半角数字での情報があり、かつ価格の範囲が¥300~¥9,999,999の間であれば出品できる' do
          @item.price = '9999999' 
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかないとき' do
        it '商品画像がなければ出品できない'do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名がなければ出品できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it '商品の説明の記載があれば出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it '商品カテゴリーの情報がなければ出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態についての情報がなければ出品できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it '発送元の地域についての情報がなければ出品できない' do
          @item.shipping_from_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping from can't be blank")
        end
        it '配送料の負担についての情報がなければ出品できない' do
          @item.shipping_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end
        it '発送までの日数についての情報がなければ出品できない' do
          @item.estimated_shipping_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
        end
        it '価格についての情報がなければ出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格について半角数字でなければ出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '価格について¥299以下では出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '価格について¥10,000,000以上では出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end


    end
  end
end

# - ログイン状態のユーザーだけが、商品出品ページへ遷移できること
# - ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること

# - 商品画像を1枚つけることが必須であること
# - 商品名が必須であること
# - 商品の説明が必須であること
# - カテゴリーの情報が必須であること
# - 商品の状態についての情報が必須であること
# - 配送料の負担についての情報が必須であること
# - 発送元の地域についての情報が必須であること
# - 発送までの日数についての情報が必須であること
# - 価格についての情報が必須であること
# - 価格の範囲が、¥300~¥9,999,999の間であること
# - 販売価格は半角数字のみ保存可能であること

# - 入力された販売価格によって、販売手数料や販売利益の表示が変わること
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
# - 入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること

