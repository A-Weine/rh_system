class UsersController < ApplicationController
  before_action :set_user, only: [ :destroy ]

  # GET users/
  def index
    @users = User.all
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
end
