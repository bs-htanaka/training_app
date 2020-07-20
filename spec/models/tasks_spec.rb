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
  describe "タスクを終了期限にソート" do
    before do
      tasks = [
        create(:task,limit_day: Time.zone.now.to_s),
        create(:task,limit_day: Time.zone.now - 1.day)
      ]
    end
      it "終了期限が降順になっている" do
        tasks = Task.all.order(limit_day: "DESC")
        expect(tasks[0][:limit_day]).to eq Time.zone.now.to_s
      end
    end
    
end