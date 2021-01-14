require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do 
    @user = FactoryBot.build(:user)
  end
  
  it '全ての値が正しく入力されていれば登録できる事' do
    expect(@user).to be_valid
  end
  it 'nicknameが空では登録できない事' do
    @user.nickname =nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空では登録できない事' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it '重複したemailでは登録できない事' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end  
  it 'emailが＠を含まないと登録できない事' do
    @user.email = "test.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'passwordが空では登録できない事' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが6文字以上でないと登録できない事' do
    @user.password = "abc12"
    @user.password_confirmation = "abc12"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'passwordが英字のみだと登録できない事' do
    @user.password = "abcdef"
    @user.password_confirmation = "abcdef"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Input at least one number, and one alphabet.")
  end

  it 'passwordが数字のみだと登録できない事' do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Input at least one number, and one alphabet.")
  end

  it 'passwordとpassword_confirmationが一致しないと登録できない事' do
    @user.password_confirmation = "abc123"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'last_nameが空では登録できない事' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
  it 'first_nameが空では登録できない事' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it 'last_nameは全角でないと登録できない事' do
    @user.last_name = "yamada"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
  end
  it 'first_nameは全角でないと登録できない事' do
    @user.first_name = "tarou"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
  end
  it 'last_name_kanaが空では登録できない事' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end
  it 'first_name_kanaが空では登録できない事' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  it 'last_name_kanaは全角カタカナでないと登録できない事' do
   @user.last_name_kana = "ﾔﾏﾀﾞ"
   @user.valid?
   expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
  end
  it 'first_name_kanaは全角カタカナでないと登録できない事' do
    @user.first_name_kana = "ﾀﾛｳ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
  end
  it 'birthdayが空では登録できない事' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end                         
end
end