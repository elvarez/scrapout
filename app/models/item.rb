class Item < ActiveRecord::Base

  belongs_to :user
  belongs_to :list

  validates :user_id, presence: true
  validates :list_id, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_the_past

  scope :todo, -> { where("done = ? AND missed = ?", false, false) }
  scope :missed, -> { where(missed: true) }
  scope :done, -> { where(done: true) }
  scope :short, -> { where("deadline <= ?", (Date.today + 7.days)) }
  scope :long, -> { where("deadline >= ? ", (Date.today + 7.days)) }
  scope :lastw, -> { where("updated_at >= ? ", (Date.today - 7.days)) }

  def time_left
    (self.deadline - Time.now)
  end

  def deadline_cannot_be_in_the_past
    errors.add(:deadline, "can't be in the past") if
      !deadline.blank? and deadline < Time.now
  end

  def remind_me
    RemindMailer.reminder_email(self.user, self.description).deliver
  end

end

