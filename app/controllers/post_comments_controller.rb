class PostCommentsController < ApplicationController

  # 今回、indexアクションやnewアクションは作成しない。
  # つまり、コメント投稿だけの一覧画面や投稿画面は作成せず、その代わり、投稿画像の詳細画面（/post_image/:id/）にコメント投稿機能を実装する。

  def create
    # コメント投稿機能を作成する。ここから
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)  # ここの行は省略した記述の仕方をしている。詳しくは4章の「コメント投稿機能を作成する」を参照しよう。
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image) # 投稿されたコメントを保存した後は、post_image_path(post_image)へリダイレクトされるように設定する。
    # ここまで
  end

  def destroy
  end

  # 以下のprivateはコメント投稿機能を作成する際に追加した。
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
