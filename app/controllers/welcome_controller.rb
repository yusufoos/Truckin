class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def send_notification
    logger.info "Device token registrato: " + params[:token].to_s
    APNS.send_notification(params[:token].to_s, 'Hello from Rails app!' )
  end
end
