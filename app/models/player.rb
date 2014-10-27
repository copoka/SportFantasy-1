class Player < ActiveRecord::Base
  has_one :real_team
  has_one :amplua
end
