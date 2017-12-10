class DownloadsController < ApplicationController

  def show
    @attendee = Attendee.find(params[:attendee_id])
    @course = Course.find(params[:course_id])
    if !@attendee.courses.find_by(id: params[:course_id])
      redirect_to @attendee, notice: "#{@attendee.fullname} not registered for #{@course.title}." and return
    elsif !@attendee.finished_evaluations.find_by(course_id: params[:course_id])
      redirect_to @attendee, notice: "#{@attendee.fullname} as not completed the evaluation for #{@course.title}." and return
    end
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
      disposition: "attachment"
    }
  end
end
