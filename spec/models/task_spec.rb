require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
  describe '#toggle_favorite' do
    it "should switch favorite to false if it was true" do
     task = Task.new(favorite: true)
     task.toggle_favorite!
     expect(task.favorite).to eq(false)
   end
   it "should switch favorite to true if it was false" do
    task = Task.new(favorite:false)
    task.toggle_favorite!
    expect(task.favorite).to eq(true)
  end
end
describe '#overdue?' do 
  it "should show if the deadline is in in the past" do
    task = Task.new(deadline: Time.now - 1.day)

    expect(task.overdue?).to eq(true)
  end

  it "should if the dealdine is in the future" do 
    task = Task.new(deadline: Time.now + 1.day)
    expect(task.overdue?).to eq(false)
  end
end 
describe '#increment_priority!' do 
  it "should show the priorities" do
    task = Task.new(priority: 5)
    task.increment_priority!
    expect(task.priority).to eq(6)
  end
  describe '#increment_priority!' do 
    it "should show the priorities" do
      task = Task.new(priority: 11)
      task.increment_priority!
      expect(task.priority).to eq(11)
    end
  end
end
describe '#decrement_priority!' do 
  it "should show the priorities" do
    task = Task.new(priority: 5)
    task.decrement_priority!
    expect(task.priority).to eq(4)
  end
end
describe '#snooze-hour!' do 
  it 'should add an hour to the current deadline' do 
     deadline = DateTime.new(2017, 3, 7)
     task = Task.new(deadline: deadline)
     task.snooze_hour!
     expect(task.deadline).to eq(deadline + 1.hour)
   end
 end
end
