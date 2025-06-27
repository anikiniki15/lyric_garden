class Lyric < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 5000 }
  validates :reference, length: { maximum: 100 }, allow_blank: true
end
