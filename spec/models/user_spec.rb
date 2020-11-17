require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '登録には次の９点が存在すれば登録できるnickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthday' do
        expect(@user).to be_valid
      end
      it 'nicknameが入力されていれば登録できる' do
        @user.nickname = Faker::Name.initials(number: 2)
        expect(@user).to be_valid
      end
      it 'emailの登録には＠が必要' do
        @user.email = Faker::Internet.free_email
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英字と数字が両方あれば登録できる' do
        @user.password = 'aaa111'
        expect(@user).to be_valid
      end
      it 'password_confirmationがpasswordと一致すれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角で入力されていれば登録できる' do
        @user.first_name = '小林'
        @user.last_name = '賢太郎'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角カナで入力されていれば登録できる' do
        @user.first_name_kana = 'コバヤシ'
        @user.last_name_kana = 'ケンタロウ'
        expect(@user).to be_valid
      end
      it 'birthdayが入力されていれば登録できる' do
        @user.birthday = '1930-01-01'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が入力されていなければ登録できない' do
        @user.email = 'mailmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aa11a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameとlast_nameが全角で入力されていなければ登録できない' do
        @user.first_name = 'kobayashi'
        @user.last_name = 'kentarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で記入してください', 'Last name 全角で記入してください')
      end
      it 'first_name_kanaとlast_name_kanaが全角カナで入力されていなければ登録できない' do
        @user.first_name_kana = 'kobayashi'
        @user.last_name_kana = 'kentarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナで記入してください', 'Last name kana 全角カナで記入してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    # メールアドレスが必須であること
    # メールアドレスは、@を含む必要があること
    # パスワードが必須であること
    # パスワードは、6文字以上での入力が必須であること
    # パスワードとパスワード（確認用）、値の一致が必須であること
    # - Deviseによるカスタムコントローラの生成は不要（rails g devise controllersのコマンドは、必須機能実装において入力不要）
  end
end
