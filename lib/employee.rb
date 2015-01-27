class Employee < ActiveRecord::Base
  belongs_to :division
  has_many :projects
  has_many :contributions, through: :projects
end
