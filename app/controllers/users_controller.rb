class UsersController < ApplicationController

  # Antes de ejecutar la acción index, edit o update del presente controller 
  # ejecutar el método before_filter
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    # Instanciamos un usuario para que posteriormente el mismo posea en su estado
    # los valores de los campos presentes en los controles del formulario de registro
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users, responde a un post a la ruta /users
  def create
    @user = User.new(params[:user])

    if @user.save
      # iniciar sesion del usuario
      sign_in @user
      # handle successful save.
      flash[:success] = "Welcome to the Sample App!" # flash solo mantendrá su estado durante la actual respuesta
      redirect_to @user # redireccionar a /users/id, ejecutar la acción show
    else
      render 'new'
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      # Actualizar current_user
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  # Si el usuario no posee una sesión iniciada entonces se redirige a la ruta signin_path
  def signed_in_user
    unless signed_in?
      # Almacenar la ruta solicitada en el request actual por las dudas de que 
      # el usuario luego se autentique correctamente y corresponda redirigirlo a la 
      # pagina que inicialmente solicito pero no pudo acceder porque se requiere inicio de sesion
      store_location
      redirect_to signin_path, notice: "please sign in."
    end
  end

  # Si el usuario intenta modificar los datos de otro usuario se lo redirige a la página principal
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
