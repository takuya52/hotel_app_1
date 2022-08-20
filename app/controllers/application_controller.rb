class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except:[:index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_q

  def search
    @results = @q.result
  end

  def after_sign_in_path_for(resource) 
    users_profile_path
  end

  def configure_permitted_parameters
    #新規登録時にユーザー名の取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    #プロフィール編集時にユーザー名、自己紹介、アイコン画像を取得
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image_name, :introduction])
  end
  
  private
  
  def set_q
    @q = Room.ransack(params[:q])
  end


end
