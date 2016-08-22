class Developer < User
  has_and_belongs_to_many :project,join_table:"developers_projects"
end
