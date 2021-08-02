FactoryBot.define do
  factory :task do
        task_name { 'task1'}
        content {'content1'}
        startdate { '1/1/2020' }
        status { 'Not started' }
        priority { 'low' }
    end
    factory :second_task, class: Task do
      task_name { 'task2'}
      content {'content2'}
      startdate { '1/3/2020' }
        status { 'Completed' }
        priority { 'high' }
    end
  end
