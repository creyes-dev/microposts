class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Iniciar sesión del usuario y redirigir a la página del perfil del usuario
      sign_in @user
    else
      # Crear un mensaje de error y volver a renderear el formulario de login
      flash.now[:error] = 'Invalid email/password combination' # No esta bien
      render 'new'
    end
  end

  def destroy
  end
end
