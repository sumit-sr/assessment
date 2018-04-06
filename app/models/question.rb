class Question < ApplicationRecord

  belongs_to :assignment
  belongs_to :user
  has_many :answers

end
