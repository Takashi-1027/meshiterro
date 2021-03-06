class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Userモデルに対して、PostImageモデルが"1:Nの関係"になるよう関連付ける。
  # 新しく「has_many」というメソッドがでてきた。
  # has_manyの後には、1:Nの関係になるモデル名を複数形で記述する。
  has_many :post_images, dependent: :destroy

  # UserモデルとPostCommentモデルとの"1:Nの関係"も実装する。==>第4章で設定した。
  has_many :post_comments, dependent: :destroy

  # いいね機能を搭載するため設定
  has_many :favorites, dependent: :destroy
  attachment :profile_image  # 画像投稿ができるように設定する。(プロフィール画像の設定機能)
end

#「:database_authenticatable, :registerable,」のように、deviseの後ろに :（コロン）で始まる部分がdeviseの機能名です。
# :database_authenticatable（パスワードの正確性を検証）
# :registerable（ユーザ登録や編集、削除）
# :recoverable（パスワードをリセット）
# :rememberable（ログイン情報を保存）
# :validatable（emailのフォーマットなどのバリデーション）