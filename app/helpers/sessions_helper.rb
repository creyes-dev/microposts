module SessionsHelper

  # Cuando un usuario inicia sesión se almacena el remember token en las cookies y se almacena
  # los datos del usuario en la variable current_user (cuya precedencia desconozco)
  def sign_in(user)
    # Permanent registra el valor en el cookie con una fecha de expiración dentro de 20 años
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  # usado para convertir "self.current_user =" a "current_user ="
  def current_user=(user)
    @current_user = user
  end

  # La unica forma de determinar si un usuario posee una sesión iniciada es verificando si los datos
  # del usuario ya se encuentra en la variable current_user o si el remember token esta almacenado
  # en las cookies del navegador del cliente
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # Método que debe ser consultado para determinar si un usuario posee una sesión iniciada
  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

	def current_user?(user)
		user == current_user
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  # Redirigir a un usuario a una ruta almacenada en la variable de sesión return_to
  # si dicha variable no existe entonces redirigirlo a la página por defecto
  # indicada por parámetros
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Almacenar una ruta a la que se podrá redirigir al usuario una vez que se cumpla
  # determinadas condiciones
  def store_location
    session[:return_to] = request.fullpath
  end
end
