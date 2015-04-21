class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def send_notification
    logger.info "Device token registrato: " + params[:token].to_s
    APNS.send_notification(params[:token].to_s, 'Hello from Rails app!' )
    redirect_to home_index_path, :notice => "Notification sent to device #{params[:token]}"
  end
end
