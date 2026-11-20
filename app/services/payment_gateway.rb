# Stand-in for Stripe. Treat it as a slow, unreliable network call.
class PaymentGateway
  class Error < StandardError; end

  def self.charge(amount_cents:)
    sleep 0.2
    "ch_#{SecureRandom.hex(8)}"
  end

  def self.refund(charge_id:, amount_cents:)
    sleep 0.2
    raise Error, "gateway timeout" if rand < 0.1
    "re_#{SecureRandom.hex(8)}"
  end
end
