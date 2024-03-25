class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

#新規登録時のストロングパラメータに「nicknameカラム」の追加
def configure_permitted_parameters
  # binding.pry
    #新規登録時のストロングパラメータに「nicknameカラムとageカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
end
end
