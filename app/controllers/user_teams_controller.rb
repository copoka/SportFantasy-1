class UserTeamsController < ApplicationController
  before_action :set_user_team, only: [:show, :edit, :update, :destroy, :add_player_to_user_team]

  #Sphinx
  def search
    @user_teams = UserTeam.search params[:search]
  end

  # GET /user_teams
  # GET /user_teams.json
  def index
    @user_teams = UserTeam.all
  end

  # GET /user_teams/1
  # GET /user_teams/1.json
  def show
    @players_on_football_field=@user_team.players_on_football_field
    @first_team_goalkeeper=@user_team.user_team_players.first_team_goalkeeper[0]
  end

  # GET /user_teams/new
  def new
    @user_team = UserTeam.new
  end

  # GET /user_teams/1/edit
  def edit
  end

  # POST /user_teams
  # POST /user_teams.json
  def create
    @user_team = UserTeam.new(user_team_params)

    respond_to do |format|
      if @user_team.save
        format.html { redirect_to @user_team, notice: 'User team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_teams/1
  # PATCH/PUT /user_teams/1.json
  def update
    respond_to do |format|
      if @user_team.update(user_team_params)
        format.html { redirect_to @user_team, notice: 'User team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_teams/1
  # DELETE /user_teams/1.json
  def destroy
    @user_team.destroy
    respond_to do |format|
      format.html { redirect_to user_teams_url }
      format.json { head :no_content }
    end
  end

  def add_player_to_user_team
    #@user_team = UserTeam.find(params[:user_team_id])
    player=@user_team.players<<Player.find(params[:player_id])
    @user_team_player=@user_team.user_team_players.last
    #TODO сделать проверку тут или в модели user_team_players и при неудачном сохранении выводить ошибку
    #render status: :ok
    #render nothing: true, status: :not_acceptable

    #render nothing: true

    #render json:{partial: '/user'} @user_team_player
    #render json: {partial: 'user_team_players/show', object: @user_team_player}
    #render 'user_team_players/show', content_type: :json, object: @user_team_player
    #render json: @user_team_player, player

    respond_to do |format|
      #format.html { redirect_to @user_team, notice: 'User team was successfully created.' }
      format.json { render template: 'user_team_players/show', status: :created }
      #format.json { render action: 'show', status: :created, location: @user_team }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_team
    @user_team = UserTeam.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_team_params
    params.require(:user_team).permit(:user, :name, :score)
  end
end
