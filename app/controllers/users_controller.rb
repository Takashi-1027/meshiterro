class UsersController < ApplicationController
  # マイページの設定
  def show
    @user = User.find(params[:id])  # ユーザのデータ1件(params[:id])を取得(find)し、インスタンス変数へ渡す(代入)。
    @post_images = @user.post_images.page(params[:page]).reverse_order  # ページングのpageメソッドを利用して、すべての投稿画像が表示されないように設定する。
    # 上記のように、そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができる。また、全体の投稿ではなく、個人が投稿したもののみを表示できる。
  end

  # プロフィールの編集ページを作成
  def edit
    @user = User.find(params[:id])    # params[:id]でユーザの情報を取得してインスタンス（@user）に保存し、編集用Viewでform_withを使う準備する。
  end

  # 編集データのh損機能のためのupdateアクション
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
