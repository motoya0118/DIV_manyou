require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task, title: 'task') }
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
     # 1. new_task_pathに遷移する（新規作成ページに遷移する）
     # ここにnew_task_pathにvisitする処理を書く
        visit new_task_path
     # 2. 新規登録内容を入力する
     #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
     # ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
     # ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
        fill_in 'title', with: 'title_test'
        fill_in 'content', with: 'content_test'
     # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
     # ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
        click_button '登録する'
     # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
     # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
     # ここにタスク詳細ページに、テストコードで作成したデータがタスク詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
        expect(page).to have_content 'title_test' && 'content_test'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
      # テストで使用するためのタスクを作成
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか。（含まれているか。）ということをexpectする（確認・期待する）
        # expect(page).to have_content 'task'
        # わざと間違った結果を期待するテストを記載する
        expect(page).to have_content 'task'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do
        it '新しいタスクが一番上に表示される' do
          FactoryBot.create(:task, title: 'task2')
          visit tasks_path
          task_list = all('.title')
          expect(task_list[0].text).to eq 'task2'
          # ここに実装する
        end
    end
    context 'タスクが終了期日の降順に並んでいる場合' do
        it '終了期日が近いタスクが一番上に表示される' do
          FactoryBot.create(:task, title: 'task2',deadline: '1999-07-18')
          visit tasks_path
          click_on '終了期限でソートする'
          task_list = all('.title')
          expect(task_list[0].text).to eq 'task'
          # ここに実装する
        end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         visit tasks_path
         click_link '詳細'
         expect(page).to have_content 'task'
       end
     end
  end


end
