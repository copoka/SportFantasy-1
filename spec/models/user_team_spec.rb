# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UserTeam, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
