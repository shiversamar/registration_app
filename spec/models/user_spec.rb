require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has lotsa stuff' do
    user1 = User.new
    user1.user_d = 'Amar'
    user1.password = 'taco'
    user1.full_name = 'A'
    user1.street_address = '123 way street'
    user1.city = 'Oceanside'
    user1.state = 'CA'
    user1.postal_code = '123'
    user1.country = 'USA'
    expect(user1.save).to eq true
    u2 = User.find_by_user_d 'Amar'
    expect(u2.user_d).to eq 'Amar'
    expect(u2.password).to eq 'taco'
  end
end
