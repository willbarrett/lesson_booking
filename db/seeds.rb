alvarez = Teacher.create!(name: "Ms. Alvarez")
chen    = Teacher.create!(name: "Mr. Chen")
priya   = Student.create!(name: "Priya")
marcus  = Student.create!(name: "Marcus")
jo      = Student.create!(name: "Jo")

tz = ActiveSupport::TimeZone["America/Los_Angeles"]
last_tuesday = tz.today.prev_occurring(:tuesday)
at = ->(h, m) { tz.local(last_tuesday.year, last_tuesday.month, last_tuesday.day, h, m) }

Booking.create!(teacher: alvarez, student: priya,  starts_at: at.(15, 30), duration_minutes: 60, price_cents: 8000, stripe_charge_id: "ch_seed1")
Booking.create!(teacher: alvarez, student: marcus, starts_at: at.(16, 0),  duration_minutes: 30, price_cents: 4500, stripe_charge_id: "ch_seed2")
Booking.create!(teacher: chen,    student: jo,     starts_at: at.(17, 0),  duration_minutes: 45, price_cents: 6000, stripe_charge_id: "ch_seed3")
