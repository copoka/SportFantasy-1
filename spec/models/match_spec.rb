# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  team_home_id    :integer
#  team_away_id    :integer
#  team_home_score :integer
#  team_away_score :integer
#  highlights      :text
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Match, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
