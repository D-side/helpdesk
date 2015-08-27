class Response < ActiveRecord::Base
  belongs_to :ticket, touch: true
  belongs_to :user # possibly, otherwise treat as customer's response

  validates :body, presence: true

  before_create do
    self.ticket.state = 'waiting_for_staff' unless self.from_staff?
  end

  after_create do
    TicketMailer.response_notification(self).deliver_later
  end

  def editable_by?(editor)
    editor == user || editor.is_admin?
  end

  def from_staff?
    user.present?
  end

  def author
    user.try(:username) || ticket.customer_name
  end
end
