class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
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
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
end
