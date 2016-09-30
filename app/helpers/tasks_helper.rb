module TasksHelper
  def task_completed?(task)
    if task.completed_at.nil?
      return false
    else
      return true
    end
  end

  def formatted_date(task)
    return "#{task.completed_at.month}/#{task.completed_at.day}/#{task.completed_at.year}"
  end

end
