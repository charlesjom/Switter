class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include SwitsHelper

  before_action :require_login

  private
    def require_login
    	unless logged_in?
    		redirect_to root_path
    	end
    end

end
