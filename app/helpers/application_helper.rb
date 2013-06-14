module ApplicationHelper
    def site_counter
        unless session[:visited]
            $site_counter += 1
        end
        $site_counter
    end
    def counter
        session[:visited] = true
        render :text => site_counter, :content_type => 'text/plain'
    end
end
