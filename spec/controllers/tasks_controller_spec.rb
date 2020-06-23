require 'rails_helper'

RSpec.describe TasksController, type: :model do
  before do
    FactoryBot.create(:task, title: "task1")
    FactoryBot.create(:task, title: "task2")
  end

  describe "GET #index" do
    context "DESC" do
      it "taskが降順で返される" do
        get tasks_url, params: {direction: "DESC"}
        expect(Task.order(limit_day: "DESC").map(&:id)).to eq [2,1]
      end
    end
  end
end