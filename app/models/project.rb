class Project < ActiveRecord::Base
  belongs_to :manager
  belongs_to :user
  has_and_belongs_to_many :ticket
  has_and_belongs_to_many :developer,join_table:"developers_projects"
end
