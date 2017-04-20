class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Balance cannot exceed #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    raise "Insufficient funds" if @balance < MIN_FARE
    @journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @journey = false
  end

end
