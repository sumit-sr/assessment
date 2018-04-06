require 'rails_helper'

RSpec.describe Question, type: :model do
 it { should belong_to(:user) }
 it { should belong_to(:assignment) }
 it { should have_many(:answers) }
end
