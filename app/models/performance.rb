class Performance < ActiveRecord::Base
  belongs_to :player
  belongs_to :real_team
  belongs_to :amplua
end
