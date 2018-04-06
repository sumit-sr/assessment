class Profile < ApplicationRecord

  belongs_to :user
  belongs_to :user

  def formated_dob
    try(:dob)
  end
end
