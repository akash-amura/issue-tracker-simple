class Manager < User
  has_many :projects

  def self.model_name
    User.model_name
  end
end
