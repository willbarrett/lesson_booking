require "test_helper"

class BookLessonTest < ActiveSupport::TestCase
  setup do
    @teacher = Teacher.create!(name: "T")
    @s1 = Student.create!(name: "A")
    @s2 = Student.create!(name: "B")
    @at = Time.zone.parse("2030-01-08 16:00")
  end

  test "books an open slot" do
    booking = book(@s1, @at, 60)
    assert booking.persisted?
  end

  test "rejects a second booking for the same slot" do
    book(@s1, @at, 60)
    assert_raises(BookLesson::SlotTaken) { book(@s2, @at, 60) }
  end

  private

  def book(student, at, minutes)
    BookLesson.new(teacher: @teacher, student: student, starts_at: at,
                   duration_minutes: minutes, price_cents: 5000).call
  end
end
