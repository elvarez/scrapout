class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :user_id, presence: true
  validates :list_id, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  def time_left
    (self.deadline - Time.now)
  end

end
