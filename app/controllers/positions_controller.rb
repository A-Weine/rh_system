class PositionsController < ApplicationController
  layout "admin"
  before_action :set_position, only: %i[ show edit update destroy ]

  # GET /positions or /positions.json
  def index
    @positions = Position.all
  end

  # GET /positions/1 or /positions/1.json
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new
    @departments = Department.all
  end

  # GET /positions/1/edit
  def edit
    @departments = Department.all
  end

  # POST /positions or /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to positions_url, notice: "Cargo foi criado com sucesso." }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1 or /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to positions_url, notice: "Cargo foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1 or /positions/1.json
  def destroy
    @position.destroy!

    respond_to do |format|
      format.html { redirect_to positions_url, notice: "Cargo foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def position_params
      params.require(:position).permit(:name, :description, :department_id, :level, :base_salary, :requirements, :benefits, :status)
    end
end
