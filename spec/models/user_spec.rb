require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created with valid inputs (must contain username, email, and password)" do
    User.destroy_all

    user = User.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com"
    )

    expect(user.id.nil?).to eql(false)
    
  end

  it "cannot be created with invalid inputs (one of username, email, or password is missing)" do
    User.destroy_all

    expect{
        User.create!(
        username: "",
        password: "",
        email: ""
      )
    }.to raise_error ActiveRecord::RecordInvalid  
  end

  it "cannot be created using username that already exists" do
    User.destroy_all

    user1 = User.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com"
    )

    expect{
      User.create!(
        username: "vincent",
        password: "Passw0rd3",
        email: "vince@vince.com"
      )
    }.to raise_error ActiveRecord::RecordInvalid   
  end

  it "cannot be created using email that already exists" do
    User.destroy_all

    user1 = User.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com"
    )

    expect{
      User.create!(
        username: "vince",
        password: "Passw0rd3",
        email: "vincent@vincent.com"
      )
    }.to raise_error ActiveRecord::RecordInvalid   
  end  

  it "can have many appointments" do
    User.destroy_all

    user = User.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com"
    )

    expect(user.appointments).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
  end

  it "can have many orders" do
    User.destroy_all
    user = User.create!(
      username: "vincent",
      password: "Passw0rd3",
      email: "vincent@vincent.com"
    )

    Order.destroy_all
    order1 = Order.create!(
      user_id: user.id,
      delivered: false
    )    
    
    order2 = Order.create!(
      user_id: user.id,
      delivered: false
    )
    
    expect(user.orders).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
  end
end
