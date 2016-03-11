class ModelagemPrivacidadesController < ApplicationController
  before_action :set_modelagem_privacidade, only: [:show, :edit, :update, :destroy]

  # GET /modelagem_privacidades
  # GET /modelagem_privacidades.json
  def index
    @modelo = Dimensao.new
    @modelo = Dimensao.all
    @modelagem_privacidades = ModelagemPrivacidade.all
   # @modelagem_privacidades.dimensoes = @modelo.first
    
    @modelagem_privacidades = Dimensao.where(:id => params[:id]).all

  end

  # GET /modelagem_privacidades/1
  # GET /modelagem_privacidades/1.json
  def show
  end

  # GET /modelagem_privacidades/new
  def new
    @modelagem_privacidade = ModelagemPrivacidade.new
  end

  # GET /modelagem_privacidades/1/edit
  def edit
  end

  # POST /modelagem_privacidades
  # POST /modelagem_privacidades.json
  def create
#    @modelagem_privacidade = ModelagemPrivacidade.new(modelagem_privacidade_params)

#    respond_to do |format|
#      if @modelagem_privacidade.save
#        format.html { redirect_to @modelagem_privacidade, notice: 'Modelagem privacidade was successfully created.' }
#        format.json { render :show, status: :created, location: @modelagem_privacidade }
#      else
#        format.html { render :new }
#        format.json { render json: @modelagem_privacidade.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /modelagem_privacidades/1
  # PATCH/PUT /modelagem_privacidades/1.json
  def update
    respond_to do |format|
      if @modelagem_privacidade.update(modelagem_privacidade_params)
        format.html { redirect_to @modelagem_privacidade, notice: 'Modelagem privacidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelagem_privacidade }
      else
        format.html { render :edit }
        format.json { render json: @modelagem_privacidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelagem_privacidades/1
  # DELETE /modelagem_privacidades/1.json
  def destroy
    @modelagem_privacidade.destroy
    respond_to do |format|
      format.html { redirect_to modelagem_privacidades_url, notice: 'Modelagem privacidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelagem_privacidade
      @modelagem_privacidade = ModelagemPrivacidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelagem_privacidade_params
      params.require(:modelagem_privacidade).permit(:dimensoes, :dimensoes_id, :valor_dimensoes_id, :controle_privacidades_id, :tipo_comunicacoes_id)
    end
end
