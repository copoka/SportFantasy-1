class RealTeamsController < ApplicationController
  before_action :set_real_team, only: [:show, :edit, :update, :destroy]
  
  #Sphinx
  def search
      @real_teams = RealTeam.search params[:search]
  end

  # GET /real_teams
  # GET /real_teams.json
  def index
    @real_teams = RealTeam.all
  end

  # GET /real_teams/1
  # GET /real_teams/1.json
  def show
  end

  # GET /real_teams/new
  def new
    @real_team = RealTeam.new
  end

  # GET /real_teams/1/edit
  def edit
  end

  # POST /real_teams
  # POST /real_teams.json
  def create
    @real_team = RealTeam.new(real_team_params)

    respond_to do |format|
      if @real_team.save
        format.html { redirect_to @real_team, notice: 'Real team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @real_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @real_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_teams/1
  # PATCH/PUT /real_teams/1.json
  def update
    respond_to do |format|
      if @real_team.update(real_team_params)
        format.html { redirect_to @real_team, notice: 'Real team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @real_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_teams/1
  # DELETE /real_teams/1.json
  def destroy
    @real_team.destroy
    respond_to do |format|
      format.html { redirect_to real_teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_team
      @real_team = RealTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def real_team_params
      params.require(:real_team).permit(:name)
    end
end
