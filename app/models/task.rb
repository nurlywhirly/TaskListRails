class Task < ActiveRecord::Base
  def self.all_completes
    task_list = Task.all.where.not(completed_at: nil)

    return task_list
  end

  def self.all_incompletes
    task_list = Task.all.where(completed_at: nil)

    return task_list
  end

end
