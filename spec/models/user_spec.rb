require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  before do
    user = build(:user)
  end

  it "ユーザーネーム、メールアドレス、パスワードがある場合、有効である" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe 'バリデーションのテスト' do
    it "nameがない場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end
