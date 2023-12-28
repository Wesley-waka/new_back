require 'rails_helper'

RSpec.describe "Admins", type: :request do
  it "allows one to signup" do
    Admin.find_by(username: "what")&.destroy_all
    Admin.find_by(email: "email")&.destroy_all

    headers = {"ContentType": "application/json"}
    post '/admin/signup', params: {"username": "what", "password": "what", "email": "what@what.com"}

    expect(response).to have_http_status(201)
  end

  it "can be destroyed" do
   Admin.find_by(username: "what")&.destroy_all
    Admin.find_by(username: "what")&.destroy_all
    Admin.find_by(email: "email")&.destroy_all

    post '/admin/signup', headers: {"ContentType": "application/json"}, params: {"username": "what", "password": "Passw03d", "email": "what@what.com"}
    
    token = JSON.parse(response.body)["jwt"]
    admin = Admin.find_by(email: "what@what.com")

    delete "/admin/delete_account", headers: {"ContentType": "application/json", "Authorization": "#{token}"}, params: {id: admin.id}

    expect(response).to have_http_status(:no_content)    
  end
end
