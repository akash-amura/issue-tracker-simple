class User < ActiveRecord::Base
  has_one :project
  validates :email, presence:true, uniqueness:true,format:{with: /\A.+?@.+?\..+$\z/}
  has_secure_password
  validates :password, presence:true,length:{in:6..50},confirmation:true
  validates :password_confirmation, presence:true
end


