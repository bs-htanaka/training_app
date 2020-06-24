class User < ApplicationRecord
  before_destroy :must_admin_user
  has_secure_password
  has_many :tasks, dependent: :destroy

private
  
  def must_admin_user
    if User.where('admin = true').count == 1 && self.admin?
      throw :abort
    end
  end

end
