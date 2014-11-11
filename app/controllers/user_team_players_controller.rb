class UserTeamPlayersController < ApplicationController
  before_action :set_user_team_player, only: [:show, :edit, :update, :destroy]

  # GET /user_team_players
  # GET /user_team_players.json
  def index
    @user_team_players = UserTeamPlayer.where user_team_id: params[:user_team_id]
  end

  # GET /user_team_players/1
  # GET /user_team_players/1.json
  def show
  end

  # GET /user_team_players/new
  def new
    @user_team_player = UserTeamPlayer.new
  end

  # GET /user_team_players/1/edit
  def edit
  end

  # POST /user_team_players
  # POST /user_team_players.json
  def create
    @user_team_player = UserTeamPlayer.new(user_team_player_params)

    respond_to do |format|
      if @user_team_player.save
        format.html { redirect_to @user_team_player, notice: 'User team player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_team_player }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_team_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_team_players/1
  # PATCH/PUT /user_team_players/1.json
  def update
    respond_to do |format|
      if @user_team_player.update(user_team_player_params)
        format.html { redirect_to @user_team_player, notice: 'User team player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_team_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_team_players/1
  # DELETE /user_team_players/1.json
  def destroy
    @user_team_player.destroy
    respond_to do |format|
      format.html { redirect_to user_team_players_url }
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
      params[:user_team_player]
    end
end
