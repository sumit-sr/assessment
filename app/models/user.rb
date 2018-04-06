class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  has_one :profile
  has_many :assignments
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :profile, reject_if: :all_blank, allow_destroy: true

  def is_admin?
    has_role?(:admin)
  end

  private

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

end
