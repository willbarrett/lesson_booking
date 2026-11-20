# Renders a simple HTML form for trying out POST /bookings in a browser.
# The app is API-only, so this controller inherits from ActionController::Base to render views.
class BookingFormsController < ActionController::Base
  def new
    @teachers = Teacher.order(:name)
    @students = Student.order(:name)
    render layout: false
  end
end
