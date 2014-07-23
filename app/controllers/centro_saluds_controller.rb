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

    respond_to do |format|
      if @centro_salud.save
        format.html { redirect_to @centro_salud, notice: 'Centro salud was successfully created.' }
        format.json { render :show, status: :created, location: @centro_salud }
      else
        format.html { render :new }
        format.json { render json: @centro_salud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centro_saluds/1
  # PATCH/PUT /centro_saluds/1.json
  def update
    respond_to do |format|
      if @centro_salud.update(centro_salud_params)
        format.html { redirect_to @centro_salud, notice: 'Centro salud was successfully updated.' }
        format.json { render :show, status: :ok, location: @centro_salud }
      else
        format.html { render :edit }
        format.json { render json: @centro_salud.errors, status: :unprocessable_entity }
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
