require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:task) { FactoryBot.create(:task, title: 'task',status:2) }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample",status:0) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.title('task')).to include(task)
        expect(Task.title('task')).not_to include(second_task)
        expect(Task.title('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.status(2)).to include(task)
        expect(Task.status(2)).not_to include(second_task)
        expect(Task.status(2).count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに内容を記載する
        expect(Task.title_status('task',2)).to include(task)
        expect(Task.title_status('task',2)).not_to include(second_task)
        expect(Task.title_status('task',2).count).to eq 1
      end
    end
  end
end
