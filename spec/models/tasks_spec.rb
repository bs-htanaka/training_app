require 'rails_helper'
RSpec.describe Task, type: :model do
  describe "バリデーション" do
    let(:task) { FactoryBot.build(:task) }
    describe "valid" do
      it "titleとdescriptionが有効" do
        expect(task).to be_valid
      end
    end
    describe "invalid" do
      it "titleが空だと無効" do
        task.title = ""
        expect(task).to be_invalid
      end
      it "descriptionが100文字以上" do
        task.description = "a" * 101
        expect(task).to be_invalid
      end
    end
  end
end