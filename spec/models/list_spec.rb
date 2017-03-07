require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Kepler")
      Task.create(complete: false, list_id: list.id, name: "Doing CFA Projects")
      Task.create(complete: false, list_id: list.id, name: "Having lunch")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end
  describe '#snooze_all_tasks!' do
    it 'should add an hour to the deadline of all tasks' do
      list = List.create(name: "Kepler")
      deadline = DateTime.new(2017, 3, 7)
      task = Task.create(deadline: deadline, list_id: list.id)
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(deadline + 1.hour)
      end
    end
  end
  describe '#total_duration' do
    it 'should return the total duration of all tasks' do
      list = List.create(name: "Kepler")
      Task.create(duration: 2, list_id: list.id, name: "Doing CFA Projects")
      Task.create(duration: 3, list_id: list.id, name: "Having lunch")
      expect(list.total_duration).to eq(5)
    end
  end
 describe '#incomplete_tasks!' do
   it 'should mark all tasks that are not complete' do
     list = List.create(name: "Kepler")
     Task.create(complete: false, list_id: list.id, name: "Doing CFA Projects")
     Task.create(complete: false, list_id: list.id, name: "Having lunch")
     incomplete_tasks = list.incomplete_tasks
     incomplete_tasks.each do |task|
      expect(task.complete).to eq(false)
     end
   end
 end
end

