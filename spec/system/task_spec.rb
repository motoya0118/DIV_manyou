require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task, title: 'task',status: 2) }
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'ステータスも登録ができる' do
        visit new_task_path
        fill_in 'title', with: 'title_test'
        fill_in 'content', with: 'content_test'
        find("#task_status").find("option[value='完了']").select_option
        click_button '登録する'
        expect(page).to have_content 'title_test' && 'content_test' && '完了'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'task'
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
         click_on '詳細'
         expect(page).to have_content 'task'
       end
     end
  end

  describe '検索機能' do
    context '検索をした場合' do
      it 'タイトルで検索できる' do
        FactoryBot.create(:task, title: 'test', status: 1)
        FactoryBot.create(:task, title: 'example', status: 0)
        visit tasks_path
        fill_in 'title', with: 'test'
        click_on '検索'
        expect(page).to have_content 'test'
        expect(page).not_to have_content 'task'
      end
      it 'ステータスで検索できる' do
        FactoryBot.create(:task, title: 'test', status: 1)
        FactoryBot.create(:task, title: 'example', status: 0)
        visit tasks_path
        find("#task_status").find("option[value='完了']").select_option
        click_on '検索'
        status_list = all('.status')
        text_list = []
        status_list.each do |f|
          text_list.push(f.text)
        end
        expect(text_list).to include '完了'
        expect(text_list).not_to include '未着手'
      end
      it 'タイトルとステータスの両方で検索できる' do
        FactoryBot.create(:task, title: 'test', status: 1)
        FactoryBot.create(:task, title: 'example', status: 0)
        visit tasks_path
        fill_in 'title', with: 'task'
        find("#task_status").find("option[value='完了']").select_option
        click_on '検索'
        status_list = all('.status')
        text_list = []
        status_list.each do |f|
          text_list.push(f.text)
        end
        expect(text_list).to include '完了'
        expect(text_list).not_to include '未着手'
        expect(page).to have_content 'task'
        expect(page).not_to have_content 'test'
      end
      it '優先順位でソートするというリンクを押すと、優先順位の高い順に並び替えられたタスク一覧が表示される' do
        FactoryBot.create(:task, title: 'test', priority: 2)
        FactoryBot.create(:task, title: 'example', priority: 1)
        visit tasks_path
        click_link '優先度でソートする'
        status_list = all('.priority')
        text_list = []
        status_list.each do |f|
          text_list.push(f.text)
        end
        expect(text_list[0]).to eq '高'
        expect(text_list[1]).to eq '中'
        expect(text_list[2]).to eq '低'
      end
    end
  end


end
