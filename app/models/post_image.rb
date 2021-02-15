class PostImage < ApplicationRecord

  # PostImageモデルに対して、Userモデルとの関係性を追加していく。20210214
  # belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することができる。20210214
  # PostImageモデルに関連付けられるのは、1つのUserモデルである。このため、単数形の「user」になっている点に注意しよう。20210214
  belongs_to :user  # ==>第3章で設定した。

  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定する。refileを使用するうえでのルールだ。
  attachment :image

  # PostImageモデルに、PostCommentモデルとの関連付けを追加する。==>第4章で設定した。
  has_many :post_comments, dependent: :destroy

  # いいね機能を搭載するための設定、PostImageモデルに関連付けを追加する
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)  # favorited_by?メソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。存在していればtrue、存在していなければfalseを返すようにしている。
    favorites.where(user_id: user.id).exists?
  end


end
