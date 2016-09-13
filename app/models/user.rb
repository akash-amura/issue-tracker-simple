class User < ActiveRecord::Base
  validates :name, presence:true, on:[:create,:update]
  validates :email, presence:true, uniqueness:true,format:{with: /\A.+?@.+?\..+$\z/},on:[:create]
  validates :email, presence:true,format:{with: /\A.+?@.+?\..+$\z/},on:[:update]
  has_secure_password
  validates :password, presence:true,length:{in:6..50},on: [ :create]#,:update_password]  
  validates :password_confirmation, presence:true,on:[:create]
  before_save :lower_fields 
  has_many :tickets, foreign_key:"owner_id"
  has_many :project_logs, class_name:"ProjectLog"


  protected 
    def lower_fields
      self.name = self.name.downcase
      self.email = self.email.downcase
    end
end


