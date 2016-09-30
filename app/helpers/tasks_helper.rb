module TasksHelper
  def task_completed?(object)
    if object.completed_at.nil? || object.name.nil?
      return false
    else
      return true
    end
  end

  def formatted_date(object)
    return "#{object.completed_at.month}/#{object.completed_at.day}/#{object.completed_at.year}"
  end

end
