class BookLesson
  class SlotTaken < StandardError; end

  def initialize(teacher:, student:, starts_at:, duration_minutes:, price_cents:)
    @teacher = teacher
    @student = student
    @starts_at = starts_at
    @duration_minutes = duration_minutes
    @price_cents = price_cents
  end

  def call
    raise SlotTaken unless slot_available?

    charge_id = PaymentGateway.charge(amount_cents: @price_cents)

    Booking.create!(
      teacher: @teacher,
      student: @student,
      starts_at: @starts_at,
      duration_minutes: @duration_minutes,
      price_cents: @price_cents,
      stripe_charge_id: charge_id
    )
  end

  private

  def slot_available?
    !Booking.confirmed.where(teacher: @teacher, starts_at: @starts_at).exists?
  end
end
