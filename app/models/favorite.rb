class Favorite < ApplicationRecord

  # いいね機能を搭載するためのアソシエーションの設定
  belongs_to :user
  belongs_to :post_image

end
