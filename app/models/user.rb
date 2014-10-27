class User < ActiveRecord::Base
  has_many :user_teams
end
