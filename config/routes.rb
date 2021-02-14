Rails.application.routes.draw do
  root to: 'homes#top'  #トップページへ
  devise_for :users     # deviseを使用する際にURLとしてusersを含むことを示している 20210213

  # resourcesメソッドは、ルーティングを一括して自動生成してくれる。20210213
  # 一方、onlyは、生成するルーティングを限定するオプションである。20210213
  # 画像投稿には、「新規投稿」「一覧」「詳細機能」「削除」しか使わないため、不要なルーティングが実行されないようにonlyを設定する。20210213
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
