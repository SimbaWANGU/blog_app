class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages

  def current_user
    @current_user = Author.first
  end
end
