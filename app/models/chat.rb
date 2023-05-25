class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :introduction, length: { maximum: 140 }
end
