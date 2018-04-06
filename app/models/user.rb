class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :assign_default_role

  has_one :profile
  has_many :assignments
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :profile, reject_if: :all_blank, allow_destroy: true

  has_many :students, :class_name => "User", foreign_key: 'faculty_id'
  belongs_to :faculty, :class_name => "User", foreign_key: 'faculty_id', :optional => true

  def faculty_name
    faculty.try(:full_name)
  end

  def full_name
    (profile.first_name + ' ' + profile.last_name).titleize
  end

  def group
    is_admin? ? 'Admin' : is_faculty? ? 'Faculty' : is_student? ? 'Student' : 'No role assigned'
  end

  def is_admin?
    has_role?(:admin)
  end

  def is_faculty?
    has_role?(:faculty)
  end

  def is_student?
    has_role?(:student)
  end

  def role_class
    is_admin? ? 'success' : is_faculty? ? 'danger' : is_student? ? 'info' : ''
  end

  def self.faculties
    self.with_role(:faculty)
  end

  def self.students
    self.with_role(:student)
  end

  private

  def assign_default_role
    return self.add_role(:faculty) if self.faculty_id.blank?
    self.add_role(:student) if self.roles.blank?
  end

end
