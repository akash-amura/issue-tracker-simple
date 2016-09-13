class Project < ActiveRecord::Base
  belongs_to :manager
  belongs_to :user
  has_and_belongs_to_many :tickets
  has_and_belongs_to_many :developers,join_table:"developers_projects"
  validates :title, presence:true
  validates :manager, presence:true
  validates :user, presence:true
end
