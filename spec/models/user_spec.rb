require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it { should have_many(:assignments) }
  it { should have_many(:questions) }
  it { should have_many(:answers) }

end
