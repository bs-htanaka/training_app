require 'rails_helper'

RSpec.describe TasksController, type: :request do
  before do
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:task, 5, user: user)
    end
  end

  describe "GET #index" do
    context "DESC" do
      it "taskが降順で返される" do
        get tasks_url, params: { direction: "DESC" }
        expect(Task.order(limit_day: "DESC").map(&:id)).to eq [5,4,3,2,1]
      end
    end
    context "ASC" do
      it "taskが昇順で返される" do
        expect(Task.order(limit_day: "ASC").map(&:id)).to eq [6,7,8,9,10]
      end
    end
  end

end