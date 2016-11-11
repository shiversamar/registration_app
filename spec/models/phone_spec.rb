require 'rails_helper'

RSpec.describe Phone, type: :model do
  it "has number and user" do
    phone = Phone.new
    phone.number = 123

    user =  User.new
    user.full_name = 'Amar'

    user.save

    phone.user = user
    # phone.user_id = user.id

    expect(phone.save).to eq true
    phone2 = Phone.find_by_number(123)
    expect(phone2.user.full_name).to eq "Amar"
  end
end
