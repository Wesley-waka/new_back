require 'rails_helper'

RSpec.describe PractitionerProfile, type: :model do
  it "can be created with valid data" do
    Department.destroy_all
    department = Department.create(name: "Human Resource")

    Practitioner.destroy_all
    practitioner = Practitioner.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com",
      department_id: department.id
    )

    PractitionerProfile.destroy_all
    practitioner_profile = PractitionerProfile.create!(
      practitioner_id: practitioner.id,
      first_name: "Vincent",
      last_name: "Vincent"
    )

    expect(practitioner_profile.id.nil?).to eql(false)
  end

  it "cannot be created with invalid data" do
    expect{PractitionerProfile.create!()}.to raise_error ActiveRecord::RecordInvalid
  end

  it "is available in the Practitioner model it belongs to" do
    Department.destroy_all
    department = Department.create(name: "Human Resource")

    Practitioner.destroy_all
    practitioner = Practitioner.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com",
      department_id: department.id
    )

    PractitionerProfile.destroy_all
    practitioner_profile = PractitionerProfile.create!(
      practitioner_id: practitioner.id,
      first_name: "Vincent",
      last_name: "Vincent"
    )

    expect(practitioner.practitioner_profiles.first).to be_instance_of(PractitionerProfile)
  end

  it "is deleted when the practitioner it belongs to is deleted" do 
    Department.destroy_all
    department = Department.create(name: "Human Resource")

    Practitioner.destroy_all
    practitioner = Practitioner.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com",
      department_id: department.id
    )

    PractitionerProfile.destroy_all
    practitioner_profile = PractitionerProfile.create!(
      practitioner_id: practitioner.id,
      first_name: "Vincent",
      last_name: "Vincent"
    )

    practitioner_profile_id = practitioner_profile.id
    practitioner.destroy

    expect{PractitionerProfile.find(practitioner_profile_id)}.to raise_error ActiveRecord::RecordNotFound
  end
end
