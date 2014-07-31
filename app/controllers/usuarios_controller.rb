class UsuariosController < ApplicationController
  before_action :show, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:pre_process, :ajustes]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.order(:email)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    if @usuario.tipo_usuario == 1
      @medico = Medico.find_by_usuario_id(@usuario.id)
    end

    if @usuario.tipo_usuario == 2
      @centro_salud = CentroSalud.find_by_usuario_id(@usuario.id)
    end
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.tipo_usuario = nil
    respond_to do |format|
      if @usuario.save
        if MailConfirm.recibido(@usuario).deliver
          format.html { redirect_to mailcheck_path(@usuario) }
          # MailConfirm.recibido(@usuario).deliver
          format.json { render :show, status: :created, location: @usuario }
        end
      else
        @usuario.errors.each do |name_, erro|
          flash[name_] = erro
        end
        format.html { redirect_to new_usuario_path }
        #format.json { render :json => { :error => @usuario.errors.full_messages }, :status => 422 }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        update_nombre_rol
        format.html { redirect_to info_cambiada_path, notice: "Usuario #{@usuario.email} fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Use callbacks to share common setup or constraints between actions.
=begin
  def set_usuario
      @usuario = Usuario.find(params[:id])
   end
=end

    # Never trust parameters from the scary internet, only allow the white list through.
   def usuario_params
      params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation, :remember_token)
   end
  def pre_process
    redirect_to phase1_path(@usuario.id)
  end

  def registro_inicio
    @usuario=Usuario.find(params[:id])
    if !signed_in?
      sign_in @usuario
    end
  end

  def ajustes
    if @usuario.tipo_usuario == nil
    else
      if @usuario.tipo_usuario == 1
        @medico = Medico.find_by_usuario_id(@usuario.id)
      end

      if @usuario.tipo_usuario == 2
        @centro_salud = CentroSalud.find_by_usuario_id(@usuario.id)
      end
    end
  end

  def modificar_info
    @usuario = Usuario.find(params[:id])
  end

  def edit_nombre
    @usuario = Usuario.find(params[:id])
  end

  def update_nombre_rol
    if @usuario.tipo_usuario == "1"
      @medico=Medico.find(@usuario.rol_id)
      @medico.nombre = @usuario.nombre
      @medico.save
    end
    if @usuario.tipo_usuario == "2"
      @centro_salud = CentroSalud.find(@usuario.rol_id)
      @centro_salud.nombre=@usuario.nombre
      @centro_salud.save
    end
  end

  #=============================================================
  #======================== SESSION ============================

  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  #=============================================================
  #======================== PRIVATE ============================
  private
    def create_remember_token
      self.remember_token = Usuario.digest(Usuario.new_remember_token)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @usuario = Usuario.find_by(remember_token: params[:remember_token])
    end
end