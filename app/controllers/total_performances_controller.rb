class TotalPerformancesController < ApplicationController
  before_action :set_total_performance, only: [:show, :edit, :update, :destroy]

  # GET /total_performances
  # GET /total_performances.json
  def index
    @total_performances = TotalPerformance.all
  end

  # GET /total_performances/1
  # GET /total_performances/1.json
  def show
  end

  # GET /total_performances/new
  def new
    @total_performance = TotalPerformance.new
  end

  # GET /total_performances/1/edit
  def edit
  end

  # POST /total_performances
  # POST /total_performances.json
  def create
    @total_performance = TotalPerformance.new(total_performance_params)

    respond_to do |format|
      if @total_performance.save
        format.html { redirect_to @total_performance, notice: 'Total performance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @total_performance }
      else
        format.html { render action: 'new' }
        format.json { render json: @total_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_performances/1
  # PATCH/PUT /total_performances/1.json
  def update
    respond_to do |format|
      if @total_performance.update(total_performance_params)
        format.html { redirect_to @total_performance, notice: 'Total performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @total_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_performances/1
  # DELETE /total_performances/1.json
  def destroy
    @total_performance.destroy
    respond_to do |format|
      format.html { redirect_to total_performances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_performance
      @total_performance = TotalPerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def total_performance_params
      params.require(:total_performance).permit(:player_id, :for_playing_up_to_60_minutes, :for_playing_60_minutes_or_more, :goals, :assists, :three_saves_gk, :penalty_save_gk, :penalty_miss, :clean_sheet, :mvps, :every_two_goals_df_gk, :yellow_cards, :red_cards, :self_goals)
    end
end
