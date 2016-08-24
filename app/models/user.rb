class User < ActiveRecord::Base
  validates :email, presence:true, uniqueness:true,format:{with: /\A.+?@.+?\..+$\z/}
  has_secure_password
  validates :password, presence:true,length:{in:6..50},confirmation:true
  validates :password_confirmation, presence:true
  before_save :lower_user_name 
  has_many :tickets, foreign_key:"owner_id"
  has_many :project_logs, class_name:"ProjectLog"

  protected 
    def lower_user_name
      self.name = self.name.downcase
    end
end


