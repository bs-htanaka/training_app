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

end