class PostComment < ApplicationRecord

  # UserモデルもPostImageモデルも関連付けられるのは1つのため、belongs_toを記述する。
  belongs_to :user              # ==>第4章で設定した
  belongs_to :post_image        # ==>第4章で設定した
end
