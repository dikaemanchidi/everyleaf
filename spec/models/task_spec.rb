require 'rails_helper'
describe 'Task model function', type: :model do
  describe 'Search function' do
    # You can change the contents of the test data as needed.
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample") }
    context 'Title is performed by scope method' do
      it "Tasks containing search keywords are narrowed down" do
        # title_seach is a Title search method presented by scope. The method name can be arbitrary.
        expect(Task.title_search('task')).to include(task)
        expect(Task.title_search('task')).not_to include(second_task)
        expect(Task.title_search('task').count).to eq 1
      end
      context 'If the content is empty' do
        it 'Validation is caught' do
          task = Task.new(title: 'Happy', content: '')
          expect(task).not_to be_valid
        end
        context 'When the content is described in the task title and content' do
        it 'validation passes ' do
          task = Task.new(title:'Happy', content: 'happy' )
          expect(task).to be_valid
        end
        end
      end
    end
  end
