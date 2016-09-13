class Artifact < ActiveRecord::Base
  serialize :data,Array
  enum category: [:task, :feature, :question, :defect, :milestone]
  belongs_to :ticket
  validates :title,:category,:ticket, presence:true
end
