class PostImagesController < ApplicationController

  def new  # 画像投稿の画面を表示するアクションメソッド
    @post_image = PostImage.new   # インスタンス変数に空のインスタンスを渡して、画像の投稿ができるようにする。
  end

  # 投稿データの保存
  def create  # 投稿データを保存するアクションメソッド
    @post_image = PostImage.new(post_image_params) # post_image_paramsでは、フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェックしている。
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path # PostImageモデルに保存した後、リダイレクトで投稿一覧画面へ戻る。
  end

  # 投稿一覧画面
  def index # 投稿された画像が一覧で表示されるようにする。
    # @post_images = PostImage.all # タイムライン上に表示する投稿データを取得できるようになる。

    # 下記のコードは上記のコメント内のコードに、1ページ分の決められた数のデータだけを、新しい順に取得するように変更している。
    # pageメソッドは、kaminariをインストールしたことで使用可能になったメソッドだ。
    @post_images = PostImage.page(params[:page]).reverse_order
  end

  # 投稿画像の詳細ページを設定する。
  def show # 詳細画面が表示されるように設定する。
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new  # コメントのインスタンス変数を記述する。
  end

  # 投稿を削除できるようにする。
  def destroy # 投稿の削除後は一覧に遷移するようにする。
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


  # 投稿データを保存するためには、Strong Parametersも必要なので、同時に(createメソッドを)定義していきます。
  # 投稿データのストロングパラメータ
  private

  def post_image_params   # post_image_paramsでは、フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェックしている。
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
