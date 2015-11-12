class User < ActiveRecord::Base

  has_many :rants
  acts_as_authentic do |c|
    c.login_field = :username
  end

end
