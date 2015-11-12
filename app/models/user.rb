class User < ActiveRecord::Base
  #acts_as_authentic do |c|
    #c.my_config_option = my_value
  #end

  has_many :rants
end
