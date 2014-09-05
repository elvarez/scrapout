class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true

end
