class ApplicationController < ActionController::Base
    protect_from_forgery
    include ApplicationHelper
    before_filter :visited, :except => :counter
    before_filter :authenticate_user!, :except => [:counter, :show, :index]
    def visited
        site_counter
        unless session[:visited]
            session[:visited] = true;
        end
    end
    def after_sign_in_path_for(resource)
        root_url
    end
end
