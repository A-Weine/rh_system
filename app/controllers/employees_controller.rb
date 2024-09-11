class EmployeesController < ApplicationController
  layout "admin"
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all

    # Filtrar por departamento através dos cargos
    if params[:department_id].present?
      @employees = @employees.joins(:position).where(positions: { department_id: params[:department_id] })
    end

    # Filtrar por intervalo de data de contratação
    if params[:start_date].present? && params[:end_date].present?
      @employees = @employees.where(hire_date: params[:start_date]..params[:end_date])
    end
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_address # Cria um novo endereço junto com o novo funcionário
    @positions = Position.all
  end

  # GET /employees/1/edit
  def edit
    @positions = Position.all
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)
    @positions = Position.all

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, notice: "O funcionário foi cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, notice: "O funcionário foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "O funcionário foi removido." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :birthdate, :gender, :cpf, :rg, :phone, :email, :positions_id, :hire_date, :salary, :status,
      address_attributes: [ :id, :street, :number, :complement, :neighborhood, :city, :state, :cep ])
    end
end
