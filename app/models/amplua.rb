# == Schema Information
#
# Table name: ampluas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Amplua < ActiveRecord::Base
  has_many :players
  has_many :performances
end
