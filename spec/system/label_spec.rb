require 'rails_helper'
RSpec.describe LabelMaster, type: :system do
  before do
    create(:user)
    create(:label_task,:with_label)
    visit new_session_path
    fill_in 'email', with: 'user@aaa.com'
    fill_in 'password', with: '1111'
    click_button 'Log in'
  end

  it 'ラベルはタスクを新規登録するときにタスクと一緒に登録できる' do
    visit new_task_path
    fill_in 'title', with: 'title_test'
    fill_in 'content', with: 'content_test'
    find("#task_status").find("option[value='完了']").select_option
    find('.checkbox').click
    click_button '登録する'
    visit tasks_path
    expect(page).to have_content("ラベル名")
  end
  it 'タスクの詳細画面でそのタスクに紐づいているラベル一覧を出力している' do
    visit tasks_path
    find('#show').click
    expect(current_path).to include("/tasks/")
    expect(page).to have_content("ラベル名")
  end
  it 'タスクの詳細画面でそのタスクに紐づいているラベル一覧を出力している' do
    create(:label_task2,:with_label2)
    visit tasks_path
    labels = all('.label')
    labels_text = ''
    labels.each { |label| labels_text.concat(label.text) }
    expect(labels_text).to include("ラベル名")
    expect(labels_text).to include("仮ラベル")
    select 'ラベル名'
    click_on '検索'
    after_labels = all('.label')
    after_labels_text = ''
    after_labels.each { |label| after_labels_text.concat(label.text) }
    expect(after_labels_text).to include("ラベル名")
    expect(after_labels_text).to_not include("仮ラベル")
  end
end
