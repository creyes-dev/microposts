class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      
      # Autenticación satisfactoria:
      # 1. Iniciar sesión del usuario
      # 2. Redirigirlo a la página que solicitó antes de iniciar sesión

      # 1. Iniciar sesión del usuario y redirigir a la página del perfil del usuario
      # en sign_in se asignan la instancia del usuario al objeto current_user para que 
      # sea consultado por otros controllers.
      sign_in @user

      # 2. Redirigir al usuario a la página que solicitó y la aplicación le denegó el acceso
      # por no estar autenticado, si el usuario fue directo a la página de login redireccionarlo
      # a la página por defecto (página principal del usuario)
      redirect_back_or user
    else
      # Crear un mensaje de error y volver a renderear el formulario de login
      flash.now[:error] = 'Invalid email/password combination' # No esta bien
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
