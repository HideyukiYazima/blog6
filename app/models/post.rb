class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  # ページネーション機能を有効化するために、kaminariを設定する
  paginates_per 10
  
end
