module StatusHelper
  def courses_unpublished_count
    courses = []
    Course.unpublished.all.each do |c|
      if is_authorized?(c)
        courses << c
      end
    end
    courses.count
  end

  def courses_published_count
    courses = []
    Course.published.all.each do |c|
      if is_authorized?(c)
        courses << c
      end
    end
    courses.count
    
  end

  def courses_finished_count
    courses = []
    Course.complete.published.each do |c|
      if is_authorized?(c)
        courses << c
      end
    end
    courses.count
  end

  def courses_current_count
    courses = []
    Course.not_complete.started.published.each do |c|
      if is_authorized?(c)
        courses << c
      end
    end
    courses.count
  end

  def courses_upcoming_count
    courses = []
    Course.upcoming.published.each do |c|
      if is_authorized?(c)
        courses << c
      end
    end
    courses.count
  end

  def evaluations_all_count
    evaluations = []
    Evaluation.all.each do |e|
      if is_authorized?(e)
        evaluations << e
      end
    end
    evaluations.count
  end

  def evaluations_assigned_count
    evaluations = []
    Evaluation.assigned.each do |e|
      if is_authorized?(e)
        evaluations << e
      end
    end
    evaluations.count
  end

  def evaluations_unassigned_count
    evaluations = []
    Evaluation.unassigned.each do |e|
      if is_authorized?(e)
        evaluations << e
      end
    end
    evaluations.count
  end

end
