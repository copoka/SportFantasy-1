class UserTeamPlayersController < ApplicationController
  before_action :set_user_team_player, only: [ :update, :destroy]

  # GET /user_team_players
  # GET /user_team_players.json
  def index
    #TODO user_team_players.json only request
    @user_team_players = UserTeamPlayer.where user_team_id: params[:user_team_id]
  end

  # POST /user_team_players
  # POST /user_team_players.json
  def create
    @user_team_player = UserTeamPlayer.new(user_team_player_params)

    respond_to do |format|
      if @user_team_player.save
        #TODO prevent deleting sort players params in players_path
        format.html { redirect_to players_path, notice: 'User team player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_team_player }
      else
        format.html { redirect_to players_path, alert: @user_team_player.errors.full_messages }
        format.json { render json: @user_team_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_team_players/1
  # PATCH/PUT /user_team_players/1.json
  def update
    respond_to do |format|
      if @user_team_player.update(user_team_player_params)
        format.html { redirect_to user_team_path(current_user.user_teams.take), notice: 'User team player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to user_team_path(current_user.user_teams.take) ,alert: @user_team_player.errors.full_messages}
        format.json { render json: @user_team_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_team_players/1
  # DELETE /user_team_players/1.json
  def destroy
    @user_team_player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player #{@user_team_player.player.name} is removed from team." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_team_player
      @user_team_player = UserTeamPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_team_player_params
      # params[:user_team_player]
      params.require(:user_team_player).permit(:player_id, :user_team_id, :first_team)
    end
end
