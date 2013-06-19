class ApplicationController < ActionController::Base
    protect_from_forgery
    before_filter :authenticate_user!, :except => [:visits, :show, :index, :search, :get_rating, :get_vote_up, :get_vote_down]
    before_filter :visited
    def visited
        max = 0
        if !session[:visited] && max < 50
            @visit = Visit.new(:browser_agent => request.env['HTTP_USER_AGENT'], 
                                :ip => request.remote_ip.to_s)
            if @visit.save
                session[:visited] = @visit.id
            else
                max += 1
                if max == 50
                  redirect_to root_url
                end
            end
        else
            @visit = Visit.find(session[:visited])
        end
        
    end
    def after_sign_in_path_for(resource)
        user_path(current_user)
    end
end
