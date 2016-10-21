class Task < ActiveRecord::Base
  belongs_to :user

  def self.all_completes
    task_list = Task.all.where.not(completed_at: nil)

    return task_list
  end

  def self.all_incompletes
    task_list = Task.all.where(completed_at: nil)

    return task_list
  end

  def user_tasks_only(records)
    records.delete_if do |record|
      record.user_id != session[:user_id]
    end
  end

end
