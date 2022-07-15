require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let(:user) { create(:user) }
  
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功する' do
            visit new_user_registration_path
            fill_in 'user[email]', with: 'email@example.com'
            fill_in 'user[name]', with: 'name'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'commit'
            expect(page).to have_content 'アカウント登録が完了しました'
            expect(current_path).to eq root_path
          end
        end
    end
  end
end