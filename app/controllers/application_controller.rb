class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    before_action :update_last_seen_at, if: :user_signed_in?
    before_action :check_offline
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :age, :adress, :email, :password, :password_confirmation)}
        
        devise_parameter_sanitizer.permit(:account_update) {|u|u.permit(:name, :age, :adress, :email, :password, :password_confirmation)}
    end
    def update_last_seen_at
        if (current_user.last_seen_at.nil? || current_user.last_seen_at < 5.minutes.ago)
            current_user.update(last_seen_at: Time.current, offline_timing: nil)
        end
    end
    def check_offline
        User.all.each do |user|
          if user.last_seen_at != nil && user.last_seen_at < 10.minutes.ago
            user.update(last_seen_at: nil, offline_timing: Time.current)
          end
        end
    end
end