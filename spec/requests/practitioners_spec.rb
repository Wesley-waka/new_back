require 'rails_helper'

RSpec.describe "Practitioners", type: :request do
  it "allows one to signup" do
    Department.destroy_all
    department = Department.create(name: "Human Resource")

    Practitioner.find_by(username: "what")&.destroy_all
    Practitioner.find_by(email: "email")&.destroy_all

    post '/practitioner/signup', params: {"username": "what", "password": "Passw0rd3", "email": "what@what.com", "department_id": department.id}

    expect(response).to have_http_status(201)
  end
end
