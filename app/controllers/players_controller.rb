class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @user_team=current_user.user_teams.first if current_user
    @real_teams=RealTeam.all
    @real_teams.unshift RealTeam.new({id: 0, name: '*'})

    @real_team_id = params[:real_team_id].to_i
    if @real_team_id==0
      # includes(:real_team) for sort by 'real_teams.name'
      @players = Player.all.includes(:real_team, :amplua).order(sort_column)
    else
      @players = RealTeam.find(@real_team_id).players.order(sort_column)
    end
    # @players.order!(sort_column)
    logger.info "sorted by #{sort_column}"
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

  def sort_column
    return 'name' if !params[:sort] || params[:sort].empty?
    return params[:sort] if  Player.column_names.include?(params[:sort])
    model, field = params[:sort].split '.'

    #get Player association, exml: model=real_teams association=RealTeam
    association=Player.reflect_on_all_associations(:belongs_to).select { |association| association.plural_name==model }
    return 'name' if association.empty?

    # klass = RealTeam
    klass=association[0].name.to_s.camelize.constantize
    return params[:sort] if klass.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end
end
