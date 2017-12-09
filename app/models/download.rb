require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(attendee, course)
    @attendee = attendee
    @course = course
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/certificate.pdf")
  end

  def filename
    "CE Certificate - #{@attendee.fullname} - #{@course.title}.pdf"
  end

  private

  attr_reader :certificate

  def as_html
    render template: "attendees/certificate",
      layout: "certificate_pdf",
      locals: { attendee: @attendee, course: @course }
  end
end
