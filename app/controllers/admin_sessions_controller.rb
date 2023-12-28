class AdminSessionsController < ApplicationController

    def create
        admin = Admin.find_by!(username: params[:username])
        admin = admin.authenticate(params[:password])
        token = issue_token(admin, "admin")

        admin_info = JSON.parse(
            admin.to_json only: [:id, :username, :email]
        )

        render json: {admin: admin_info, jwt: token }, status: :created
    end

    def destroy
        head :no_content
    end

    private
    def couldnt_log_you_in
        render json: {error: "Couldn't log you in. Check to confirm if your passowrd is correct"}, status: :unprocessable_entity
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(not_found)
        render json: not_found, status: 404
    end 
end
