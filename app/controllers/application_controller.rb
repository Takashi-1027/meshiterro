class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]  # ログイン認証が成功していないと、トップページ以外の画面（ログインと新規登録は除く）は表示できない仕様
  before_action :configure_permitted_parameters, if: :devise_controller?  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行される

  protected

  def after_sign_in_path_for(resource) # ログイン後は投稿画像一覧（post_images）に遷移する。
    post_images_path
  end


  #----------------------------------------------------------------------------------------------------------------------------------------------------------
  # configure_permitted_parameters では、 devise_parameter_sanitizer.permit でnameのデータ操作を許可するアクションメソッドが指定されている。
  # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可される。
  # これは、CARAVAN作成時の Strong Parameters と同様の機能だ。
  # privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。
  #----------------------------------------------------------------------------------------------------------------------------------------------------------
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
