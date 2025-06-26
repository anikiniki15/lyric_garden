class Lyric < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :reference, length: { maximum: 5000 }
end
