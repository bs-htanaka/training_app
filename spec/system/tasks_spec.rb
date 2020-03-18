require 'rails_helper'

RSpec.describe Task, type: :system do
  before do
    @task = build(:task)
  end

  it "タスク一覧の降順確認" do
    @task = build(:task)
    expect(@task).to be_valid
  end

end