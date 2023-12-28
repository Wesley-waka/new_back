class ApplicationController < ActionController::Base

        before_action :authorized 
        
        def authorized
            unless logged_in?
              render json: { message: "Please log in" }, status: :unauthorized
            end
        end

end
