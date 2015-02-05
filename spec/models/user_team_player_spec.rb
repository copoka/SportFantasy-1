# == Schema Information
#
# Table name: user_team_players
#
#  id           :integer          not null, primary key
#  user_team_id :integer
#  player_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe UserTeamPlayer, :type => :model do
  describe 'before_create checks' do
    context 'check_max_players_count' do
      before(:all) { FactoryGirl.create_list(:player, 20) }

      it 'UserTeamPlayer can created if UserTeamPlayers count less than UserTeamPlayer::MAX_PLAYERS_COUNT' do
        user_team=FactoryGirl.create :user_team_with_players, players_count: 3
        user_team.user_team_players.create FactoryGirl.attributes_for :user_team_player, user_team: user_team
        expect(user_team.user_team_players.count).to eq 4
      end

      it 'UserTeamPlayer can not created if UserTeamPlayers count more or equal than UserTeamPlayer::MAX_PLAYERS_COUNT' do
        true
      end

    end
  end
end
