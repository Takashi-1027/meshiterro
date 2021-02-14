class PostImage < ApplicationRecord

  # PostImageモデルに対して、Userモデルとの関係性を追加していく。20210214
  # belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することができる。20210214
  # PostImageモデルに関連付けられるのは、1つのUserモデルである。このため、単数形の「user」になっている点に注意しよう。20210214
  belongs_to :user

  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定する。refileを使用するうえでのルールだ。
  attachment :image
end
