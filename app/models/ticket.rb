class Ticket < ActiveRecord::Base
  LETTERS = [*'A'..'Z']
  DIGITS  = [*'0'..'9']

  # TODO: well, no staff exists at this point
  # belongs_to :owner

  before_create do
    self.reference = random_reference
  end

  state_machine initial: :waiting_staff do
    state :waiting_staff
    state :waiting_customer
    state :on_hold
    state :cancelled
    state :completed

    # TODO: draw transitions
  end

  private

  def random_three_from(chars)
    3.times.map { chars.sample }.join
  end

  def random_reference
    [
      # DRYing it up is not worth it
      'Ticket',
       random_three_from(LETTERS),
       random_three_from(DIGITS),
       random_three_from(LETTERS),
       random_three_from(DIGITS),
       random_three_from(LETTERS)
    ].join('-')
  end
end
