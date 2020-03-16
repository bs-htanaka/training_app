require 'rails_helper'

RSpec.describe Task, type: :system do
  before do
    build(:task)
  end
  
  it 'タスク' do
    task = create(:task)
    expect(task).to be_valid
  end
end