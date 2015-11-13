class User < ActiveRecord::Base
  acts_as_followable
  has_many :rants
  acts_as_authentic do |c|
    c.login_field = :username
  end

end
