require 'rails_helper'

RSpec.describe User, type: :model do

  it "is not valid without a title"

  it { should belong_to :assignment  }
  it { should belong_to :user  }

end
