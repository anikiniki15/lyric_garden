class Lyric < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 5000 }
  validates :reference, length: { maximum: 100 }, allow_blank: true

  paginates_per 10  # ← 1ページ10件に変更

  def self.ransackable_attributes(auth_object = nil)
    %w[title body reference created_at id updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]  # :userアソシエーションを検索許可
  end

  # Ransackで「タイトル or 本文 or 参考作品」の横断検索を実現
  ransacker :title_or_body_or_reference_cont do |parent|
    Arel::Nodes::Grouping.new(
      parent.table[:title].matches("%#{parent.context.params.dig(:q, :title_or_body_or_reference_cont)}%")
      .or(parent.table[:body].matches("%#{parent.context.params.dig(:q, :title_or_body_or_reference_cont)}%"))
      .or(parent.table[:reference].matches("%#{parent.context.params.dig(:q, :title_or_body_or_reference_cont)}%"))
    )
  end
end
