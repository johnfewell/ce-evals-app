class PrimerFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-control"))
  end

  def text_area(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-control"))
  end

  def password_field(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-control"))
  end

  def email_field(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-control"))
  end

  def text_field(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-control"))
  end

  def check_box(attribute, options={})
    super(attribute, options.reverse_merge(class: "form-checkbox"))
  end


end
