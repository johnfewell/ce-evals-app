module NavHelper

  def current_class?(test_path)
    request.path == test_path ? 'UnderlineNav-item selected' : 'UnderlineNav-item'
  end

  def current_page?(test_path)
    request.path == test_path ? 'tabnav-tab selected' : 'tabnav-tab'
  end

end
