class Ticket < ActiveRecord::Base
  enum state: [:open,:assessing, :working, :testing, :deferred, :rejected, :closed]
  enum priority: [:low, :mid, :high, :urgent]
  enum category: [:task, :feature, :question, :defect, :milestone]
  has_many :artifacts
  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :project
end