class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy ]


  # GET users/
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in(@user) unless user_signed_in?
        format.html { redirect_to users_path, notice: "Usuário criado com sucesso." }
        format.json { render json: @user, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @users = User.all
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "Usuário foi atualizado com sucesso." }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE users/:id
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Usuário foi removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Método privado para definir o usuário a ser destruído
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :access_level, department_ids: [])
  end

  def allow_new_user_access
    if user_signed_in?
      redirect_to root_path, alert: "Você já está logado."
    elsif User.admin.exists?
      redirect_to root_path, alert: "Não é possível cadastrar um novo usuário enquanto houver um admin cadastrado."
    end
  end
end
