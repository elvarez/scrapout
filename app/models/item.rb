class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :user_id, presence: true
  validates :list_id, presence: true
  validates :description, presence: true

  def days_left
    7 - ((Time.now - self.created_at) / 1.day ).floor
  end

end
