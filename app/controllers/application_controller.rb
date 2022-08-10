class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) 
    users_profile_path
  end

  def configure_permitted_parameters
    #新規登録時にユーザー名の取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    #プロフィール編集時にユーザー名、自己紹介、アイコン画像を取得
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image_name, :introduction])
  end
  
end
