class Ticket < ActiveRecord::Base
  # Consider using AASM if state management becomes complicated
  STATES  = %w(
    waiting_for_staff
    waiting_for_customer
    on_hold
    cancelled
    completed
  ).freeze

  LETTERS = [*'A'..'Z'].freeze
  DIGITS  = [*'0'..'9'].freeze

  validates :customer_name, :customer_email, :subject, :body,
    presence: true
  validates :customer_email,
    email: true
  validates :state, inclusion: {in: STATES}

  scope :unassigned, -> { where(owner: nil) }
  scope :open,       -> { where(state: 'waiting_for_staff') }
  scope :on_hold,    -> { where(state: 'on_hold') }
  scope :closed,     -> { where(state: %w(cancelled completed)) }

  has_many :responses

  belongs_to :owner, class_name: 'User'

  before_create do
    self.reference = random_reference
  end

  def to_param
    reference
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
