module TasksHelper
  def task_completed?(object)
    if object.completed_at.nil? || object.name.nil?
      return false
    else
      return true
    end
  end
end
