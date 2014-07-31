class CentroSaludsController < ApplicationController
  before_action :set_centro_salud, only: [:show, :edit, :update, :destroy]

  # GET /centro_saluds
  # GET /centro_saluds.json
  def index
    @centro_saluds = CentroSalud.all
  end

  # GET /centro_saluds/1
  # GET /centro_saluds/1.json
  def show
  end

  # GET /centro_saluds/new
  def new
    @centro_salud = CentroSalud.new
  end

  # GET /centro_saluds/1/edit
  def edit
  end

  # POST /centro_saluds
  # POST /centro_saluds.json
  def create
    @centro_salud = CentroSalud.new(centro_salud_params)
    @centro_salud.usuario_id = params[:usuario_id_aux]
    @usuario=Usuario.find(params[:usuario_id_aux])
    @centro_salud.nombre = @usuario.nombre

    respond_to do |format|
      if not_update_tipo_usuario
        if @centro_salud.save
          @usuario.tipo_usuario = 2
          @usuario.rol_id = @centro_salud.id
          if @usuario.save
            format.html { redirect_to @centro_salud }
            #format.json { render :show, status: :created, location: @centro_salud }
          else
            @centro_salud.delete
            @usuario.errors.each do  |name_, erro|
              flash[name_] = erro
            end
            format.html { redirect_to  registro_centro_path(@usuario) }
          end
        else
          @centro_salud.errors.each do |name_, erro|
            flash[name_] = erro
          end
          format.html { redirect_to  registro_centro_path(@usuario) }
        end
      else
        @usuario.errors.each do |name_, erro|
          flash[name_] = erro
        end
        format.html { redirect_to already_registered_path }
      end

    end
  end

  # PATCH/PUT /centro_saluds/1
  # PATCH/PUT /centro_saluds/1.json
  def update
    respond_to do |format|
      if @centro_salud.update(centro_salud_params)
        format.html { redirect_to @centro_salud }
        format.json { render :show, status: :ok, location: @centro_salud }
      else
        @centro_salud.errors.each do |name_, erro|
          flash[name_] = erro
        end
        format.html { render :edit }
      end
    end
  end

  # DELETE /centro_saluds/1
  # DELETE /centro_saluds/1.json
  def destroy
    @centro_salud.destroy
    respond_to do |format|
      format.html { redirect_to centro_saluds_url, notice: 'Centro salud was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centro_salud
      @centro_salud = CentroSalud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centro_salud_params
      params.require(:centro_salud).permit(:email, :nombre, :rif, :descripcion, :estado, :ciudad, :direccion, :direccion_fiscal, :telefono, :fax, :sitio_web)
    end
end
