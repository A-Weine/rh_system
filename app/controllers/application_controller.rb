class ApplicationController < ActionController::Base
  layout "admin" # Define layout para página admin
  before_action :authenticate_user! # Pede para usuário se autenticar caso esteja deslogado.
  before_action :configure_permitted_parameters, if: :devise_controller? # Chama função que configura os parâmetros necessários para o Devise

  protected

  def configure_permitted_parameters
    # Permite os parâmetros necessários para a criação do usuário de acordo como é requerido pela gem Devise
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :access_level, :email, :password, :password_confirmation, department_ids: [])
    end

    # Permite os parâmetros necessários para a atualização do usuário de acordo como é requerido pela gem Devise
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :access_level, :email, :password, :password_confirmation, department_ids: [])
    end
  end

  # Função que redireciona para a tela de login após o logout.
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  # Função para verificar se o controlador atual é a página inicial
end
