class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # Sphinx
  def search_by_name
      @players = ThinkingSphinx.search(Riddle::Query.escape(params[:search], :classes => [Player, RealTeam], :ranker => :proximity_bm25, :match_mode => :any))
  end

  def search_sort_by_team
      @players = ThinkingSphinx.search(Riddle::Query.escape(params[:search], :classes => [Player, RealTeam], :order => :real_team, :ranker => :proximity_bm25, :match_mode => :any))
  end

  def search_sort_by_amplua
      @players = Player.search(Riddle::Query.escape(params[:search], :order => :amplua_id, :ranker => :proximity_bm25, :match_mode => :any)) #эта штука ищет только по именам и группирует их по айди амплуа
  end

  def search_amplua
      @players = ThinkingSphinx.search(Riddle::Query.escape(params[:search], :classes => [Amplua] )) # => не работает пока
  end

  # GET /players
  # GET /players.json
  def index
    @user_team=current_user.user_teams.first
    @real_teams=RealTeam.all

    if params[:real_team_id]=='-1' or  params[:real_team_id]==nil
      @players = Player.all
    else
      @players = RealTeam.find(params[:real_team_id]).players
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :real_team_id, :amplua_id, :price, :score)
    end
end
