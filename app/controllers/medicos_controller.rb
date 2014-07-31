class MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :edit, :update, :destroy, :ver_servicios_medicos, :registrar_servicios_medicos, :editar_servicios_medicos]

  # GET /medicos
  # GET /medicos.json

  def registro_medico
    @usuario=Usuario.find_by(params[:id])
  end

  def index
    @medicos = Medico.all
  end

  # GET /medicos/1
  # GET /medicos/1.json
  def show
    @medico = Medico.find(params[:id])
    @usuario = Usuario.find(@medico.usuario_id)
  end

  # GET /medicos/new
  def new
    @medico = Medico.find_by_usuario_id(params[:id])
    @medico = Medico.new
  end

  # GET /medicos/1/edit
  def edit
  end

  # POST /medicos
  # POST /medicos.json
  def create
    @medico = Medico.new(medico_params)
    @medico.usuario_id = params[:usuario_id_aux]
    @usuario = Usuario.find(params[:usuario_id_aux])
    @medico.nombre=@usuario.nombre
    respond_to do |format|
      if not_update_tipo_usuario
        if @medico.save
          @usuario.tipo_usuario = 1
          @usuario.rol_id = @medico.id
          if @usuario.save
            format.html { redirect_to @medico }
          else
            @medico.delete
            @usuario.errors.each do |name_, erro|
              flash[name_] = erro
            end
            format.html { redirect_to registro_medico_path(@usuario) }
          end
        else
          @medico.errors.each do |name_, erro|
            flash[name_] = erro
          end
          format.html { redirect_to registro_medico_path(@usuario) }
        end
      else
        @usuario.errors.each do |name_, erro|
          flash[name_] = erro
        end
        format.html { redirect_to already_registered_path}
      end

    end
  end

  def registro_medico

  end

  # PATCH/PUT /medicos/1
  # PATCH/PUT /medicos/1.json
  def update
    respond_to do |format|
      if @medico.update(medico_params)
        format.html { redirect_to info_cambiada_path }
      else
        @medico.errors.each do |name_, erro|
          flash[name_] = erro
        end
       format.html { render :edit }
      end
    end
  end

  # DELETE /medicos/1
  # DELETE /medicos/1.json
  def destroy
    @medico.destroy
    respond_to do |format|
      format.html { redirect_to medicos_url, notice: 'Medico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def registrar_servicios_medicos

  end

  def editar_servicios_medicos
  end

  def ver_servicios_medicos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_params
      params.require(:medico).permit(:email, :nombre, :apellido, :cedula, :direccion, :telefono_casa, :telefono_celular, :telefono_oficina, :sexo, :fecha_nacimiento, :especialidad, :cmv, :cv, :url, :centro_salud, :servicio_medico, :modalidad_consulta, :horario_consulta, :precio_consulta, :telefono_consultorio)
    end

    def servicios_medicos_params
      params.require(:medico).permit(:centro_salud, :servicio_medico, :modalidad_consulta, :horario_consulta, :precio_consulta, :telefono_consultorio)
    end
end
