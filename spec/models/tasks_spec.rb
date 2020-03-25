require 'rails_helper'

RSpec.describe Task, type: :model do
  
  it "titleとdescriptionが入力された時は有効" do
    task = build(:task)
    expect(task).to be_valid
  end

  it "titleが空の場合は無効" do
    task = build(:task,title: "")
    expect(task).to_not be_valid
  end

  describe "description length" do
    context "descriptionが75文字の時" do
      it "true" do
        task = build(:task,description: "a" * 75)
        expect(task).to be_valid
      end
    end

    context "descriptionが76文字の時" do
        it "false" do
          task = build(:task,description: "a" * 76)
          expect(task).to_not be_valid
        end
      end

  end

    it "終了期限で並び替えできている" do
      create(:task, title: 'task2', description: 'task2', created_at: Time.now, updated_at: Time.now, limit_day: Time.current + 1.days)
      create(:task, title: 'task3', description: 'task3', created_at: Time.now, updated_at: Time.now, limit_day: Time.current + 2.days)
      create(:task, title: 'task4', description: 'task4', created_at: Time.now, updated_at: Time.now, limit_day: Time.current + 3.days)
      tasks = Task.all.order(id: "DESC")
      expect(tasks[0][:id]).to eq 3
    end

end