module CourseStatusHelper
  def courses_unpublished_count
  end

  def courses_published_count
    Course.published.all.count
  end

  def courses_finished_count
    Course.complete.published.count
  end

  def courses_current_count
    Course.not_complete.started.published.count
  end

  def courses_upcoming_count
    Course.upcoming.published.count
  end


end
