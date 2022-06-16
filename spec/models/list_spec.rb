require 'rails_helper'

RSpec.describe 'Listモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    it "nameがない場合は登録できないこと" do
      list = build(:list, name: nil)
      list.valid?
      expect(list.errors[:name]).to include("を入力してください")
    end
  end
end
