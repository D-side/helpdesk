class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable, :lockable

  has_many :responses

  has_many :tickets, foreign_key: 'owner_id'

  def admin?
    is_admin
  end

  # HACK: Sympthomatic fix of :validatable which requires email.
  #       Devise doesn't really like having NO email AT ALL. Emails for staff
  #       will likely be added in the future, so this hack can be removed.
  #       Have I fallen prey to Devise epidemic?
  #       Should I have used Sorcery instead?
  #       No clue. No time either.
  def email_required?
    false
  end

  def email_changed?
    false
  end
  # HACK: ends here
end
