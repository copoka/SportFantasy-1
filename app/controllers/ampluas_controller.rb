class AmpluasController < ApplicationController
  before_action :set_amplua, only: [:show, :edit, :update, :destroy]

  # GET /ampluas
  # GET /ampluas.json
  def index
    @ampluas = Amplua.all
  end

  # GET /ampluas/1
  # GET /ampluas/1.json
  def show
  end

  # GET /ampluas/new
  def new
    @amplua = Amplua.new
  end

  # GET /ampluas/1/edit
  def edit
  end

  # POST /ampluas
  # POST /ampluas.json
  def create
    @amplua = Amplua.new(amplua_params)

    respond_to do |format|
      if @amplua.save
        format.html { redirect_to @amplua, notice: 'Amplua was successfully created.' }
        format.json { render action: 'show', status: :created, location: @amplua }
      else
        format.html { render action: 'new' }
        format.json { render json: @amplua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ampluas/1
  # PATCH/PUT /ampluas/1.json
  def update
    respond_to do |format|
      if @amplua.update(amplua_params)
        format.html { redirect_to @amplua, notice: 'Amplua was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @amplua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ampluas/1
  # DELETE /ampluas/1.json
  def destroy
    @amplua.destroy
    respond_to do |format|
      format.html { redirect_to ampluas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amplua
      @amplua = Amplua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amplua_params
      params.require(:amplua).permit(:name)
    end
end
