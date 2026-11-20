class BookingsController < ApplicationController
  def create
    booking = BookLesson.new(
      teacher: Teacher.find(params[:teacher_id]),
      student: Student.find(params[:student_id]),
      starts_at: Time.zone.parse(params[:starts_at]),
      duration_minutes: params[:duration_minutes].to_i,
      price_cents: params[:price_cents].to_i
    ).call

    render json: booking, status: :created
  rescue BookLesson::SlotTaken
    render json: { error: "slot taken" }, status: :conflict
  end
end
