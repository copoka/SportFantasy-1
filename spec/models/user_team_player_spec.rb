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
require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation

RSpec.describe UserTeamPlayer, :type => :model do
  describe 'before_create checks' do
    before(:all) { DatabaseCleaner.start; FactoryGirl.create_list(:player, 20) }
    after(:all) { DatabaseCleaner.clean }

    context 'check_max_players_count' do

      it 'UserTeamPlayer can created if UserTeamPlayers count less than UserTeamPlayer::MAX_PLAYERS_COUNT' do
        user_team=FactoryGirl.create :user_team_with_players, players_count: 3
        user_team.user_team_players.create FactoryGirl.attributes_for :user_team_player, user_team: user_team
        expect(user_team.user_team_players.count).to eq 4
      end

      it 'UserTeamPlayer can not created if UserTeamPlayers count more or equal than UserTeamPlayer::MAX_PLAYERS_COUNT' do
        user_team=FactoryGirl.create :user_team_with_players, players_count: UserTeamPlayer::MAX_PLAYERS_COUNT
        user_team_player=user_team.user_team_players.create FactoryGirl.attributes_for :user_team_player, user_team: user_team
        expect(user_team_player.errors).to include(:max_players_count)
      end

    end

    context 'check_for_duplicates' do
      it 'UserTeamPlayer can not created if current player already exist in user team' do
        user_team=FactoryGirl.create :user_team_with_players, players_count: 3
        user_team_player=user_team.user_team_players.create FactoryGirl.attributes_for :user_team_player, user_team: user_team
        dub_user_team_player=user_team.user_team_players.create FactoryGirl.attributes_for :user_team_player, user_team: user_team, player: user_team_player.player
        expect(dub_user_team_player.errors).to include(:player)
      end
    end
  end

  describe 'before_update checks' do
    context 'check_place_on_football_field' do
      pending 'later'
    end
  end

  describe 'scopes' do
    before(:all) do
      DatabaseCleaner.start

      Amplua.create name: 'Вратарь'
      Amplua.create name: 'Защитник'
      Amplua.create name: 'Полузащитник'
      Amplua.create name: 'Нападающий'

      Player.create amplua_id: 1
      Player.create amplua_id: 2
      Player.create amplua_id: 3
      Player.create amplua_id: 4

      FactoryGirl.create_list :user_team_player, 5, first_team: true, player_id: 4
      FactoryGirl.create_list :user_team_player, 4, first_team: true, player_id: 3
      FactoryGirl.create_list :user_team_player, 3, first_team: true, player_id: 2
      FactoryGirl.create_list :user_team_player, 2, first_team: true, player_id: 1
    end
    after(:all) { DatabaseCleaner.clean }
    context 'first_team_players' do
      it "should be right count" do
        expect(UserTeamPlayer.first_team_players.count).to eq 14
      end
    end
    context 'first_team_forwards' do
      it "should be right count" do
        expect(UserTeamPlayer.first_team_forwards.count).to eq 5
      end
    end
    context 'first_team_middels' do
      it "should be right count" do
        expect(UserTeamPlayer.first_team_middels.count).to eq 4
      end
    end
    context 'first_team_defenders' do
      it "should be right count" do
        expect(UserTeamPlayer.first_team_defenders.count).to eq 3
      end
    end
    context 'first_team_goalkeeper' do
      it "should be right count" do
        expect(UserTeamPlayer.first_team_goalkeeper.count).to eq 2
      end
    end
  end
end
