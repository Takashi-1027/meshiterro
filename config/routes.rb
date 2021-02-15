Rails.application.routes.draw do
    # get 'users/show' <== マイページを作成するための削除した。第5章。
  root to: 'homes#top'  #トップページへ
  devise_for :users     # deviseを使用する際にURLとしてusersを含むことを示している 20210213
    # resourcesメソッドは、ルーティングを一括して自動生成してくれる。20210213
    # 一方、onlyは、生成するルーティングを限定するオプションである。20210213
    # 画像投稿には、「新規投稿」「一覧」「詳細機能」「削除」しか使わないため、不要なルーティングが実行されないようにonlyを設定する。20210213

    # resources :post_images, only: [:new, :create, :index, :show, :destroy] このコードは以下のコードが実装される前のコードだ。

    # コメントは、投稿画像に対してコメントされます。このため、post_commentsは、post_imagesに結びつきます。
    # 以下のように親子関係になります。
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      # いいね機能のルーティンング
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

    # コントローラを生成するコマンドを実行した際、routes.rbファイルにget 'users/show'というルーティングが生成される。
    # resourcesの設定と重複を避けるために既存のget 'users/show' のルーティングを削除する。
  resources :users, only: [:show, :edit, :update]   # onlyを使って、不必要なルーティングが生成されるのを制限しよう。
                                                    # 編集ページのeditアクション用のルーティングを追加する。
                                                    # 編集データの保存機能のupdataアクション用のルーティングを追加する。

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
