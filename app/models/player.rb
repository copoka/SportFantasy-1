# == Schema Information
#
# Table name: players
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  real_team_id :integer
#  amplua_id    :integer
#  price        :float
#  score        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  past_score_1 :integer          default(0)
#  past_score_2 :integer          default(0)
#  past_score_3 :integer          default(0)
#  past_score_4 :integer          default(0)
#

class Player < ActiveRecord::Base

<<<<<<< HEAD
=======
  has_many :performances
  has_one :total_performance
>>>>>>> thinking-sphinx-set-up
end
