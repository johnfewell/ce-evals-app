class DownloadsController < ApplicationController
  def show
    # @attendee = Attendee.find(params[:attendee_id])
    # @course = Course.find(params[:course_id])
    respond_to do |format|
      format.pdf { send_certificate_pdf }
    end
  end

  private

  def attendee
    Attendee.find(params[:attendee_id])
  end

  def course
    Course.find(params[:course_id])
  end

  def download
    Download.new(attendee, course)
  end

  def send_certificate_pdf
    send_file download.to_pdf, download_attributes
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end
end
