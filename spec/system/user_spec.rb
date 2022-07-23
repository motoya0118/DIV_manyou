require 'rails_helper'
RSpec.describe 'STEP4', type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user)}
  let!(:user) { FactoryBot.create(:user) }
  describe 'ユーザ登録のテスト' do
    context 'タスクを新規作成した場合' do
    # 必要に応じて、テストデータの内容を変更して構わない
      it 'ユーザの新規登録ができること' do
        visit new_user_path
        fill_in 'email', with: 'user3@aaa.com'
        fill_in 'password', with: '1111'
        fill_in 'password_confirmation', with: '1111'
        click_button '登録'
        expect(page).to have_content 'user3@aaa.com'
      end
    end

    context 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき' do
      it 'ログイン画面に遷移すること' do
        visit tasks_path
        expect(page).to have_content 'Login'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'セッション機能のテスト' do
      it 'ログインができること & 自分の詳細画面(マイページ)に飛べること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        expect(current_path).to include '/users/'
        expect(page).to have_content 'user@aaa.com'
      end

      it '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit user_path(1)
        expect(current_path).to include '/tasks'
      end
      it 'ログアウトができること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        url = current_url
        click_on 'Logout'
        visit url
        expect(current_path).to include 'sessions/new'
      end
    end
  end
  describe '管理画面のテスト' do
    context '管理画面のテスト' do
      it '管理ユーザは管理画面にアクセスできること' do
        visit new_session_path
        fill_in 'email', with: 'admin@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit admin_users_path
        expect(current_path).to include 'admin/users'
      end
      it '一般ユーザは管理画面にアクセスできないこと' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit admin_users_path
        expect(current_path).not_to include 'admin/users'
      end
      it '管理ユーザはユーザの新規登録ができること' do
        visit new_session_path
        fill_in 'email', with: 'admin@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit new_admin_user_path
        fill_in 'email', with: 'user_new@aaa.com'
        fill_in 'password', with: '1111'
        fill_in 'password_confirmation', with: '1111'
        click_button '登録'
        visit admin_users_path
        expect(page).to have_content 'user_new@aaa.com'
      end
      it '管理ユーザはユーザの詳細画面にアクセスできること' do
        visit new_session_path
        fill_in 'email', with: 'admin@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        paths = current_path.split('/')
        num = paths[-1].to_i + 1
        visit admin_user_path(num)
        expect(page).to have_content 'user@aaa.com'
      end
      it '管理ユーザはユーザの編集画面からユーザを編集できること' do
        visit new_session_path
        fill_in 'email', with: 'admin@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        paths = current_path.split('/')
        num = paths[-1].to_i + 1
        visit edit_admin_user_path(num)
        fill_in 'email', with: 'change@aaa.com'
        click_button '登録'
        visit admin_users_path
        expect(page).to have_content 'change@aaa.com'
      end
      it '管理ユーザはユーザの削除をできること' do
        visit new_session_path
        fill_in 'email', with: 'admin@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_content 'user@aaa.com'
        link = all('a', text: 'Destroy')
        link[1].click
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'user@aaa.com'
      end



    end
  end
end
