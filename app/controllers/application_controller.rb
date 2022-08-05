class ApplicationController < ActionController::Base
  include SessionHelper

  add_flash_types :success, :alert
end
