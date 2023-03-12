class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  # ページネーション機能を有効化するために、kaminariを設定する
  paginates_per 10

  scope :search_title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :search_content, ->(content) { where('content LIKE ?', "%#{content}%") }
  
  validates :image, presence: true

end
