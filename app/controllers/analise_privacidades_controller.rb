class AnalisePrivacidadesController < ApplicationController
  before_action :set_analise_privacidade, only: [:show, :edit, :update, :destroy]

  # GET /analise_privacidades
  # GET /analise_privacidades.json
  def index
    @analise_privacidades = AnalisePrivacidade.all
  end

  # GET /analise_privacidades/1
  # GET /analise_privacidades/1.json
  def show
  end

  # GET /analise_privacidades/new
  def new
    
    @analise_privacidade = AnalisePrivacidade.new
    
    #3.times { tipo_comunicacao = @analise_privacidade.tipo_comunicacoes.build }
    
    
  end

  # GET /analise_privacidades/1/edit
  def edit
    
  end

  # POST /analise_privacidades
  # POST /analise_privacidades.json
  def create
    @analise_privacidade = AnalisePrivacidade.new(analise_privacidade_params)
    
    
    
    

    respond_to do |format|
      if @analise_privacidade.save
        format.html { redirect_to @analise_privacidade, notice: 'Analise privacidade was successfully created.' }
        format.json { render :show, status: :created, location: @analise_privacidade }
      else
        format.html { render :new }
        format.json { render json: @analise_privacidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analise_privacidades/1
  # PATCH/PUT /analise_privacidades/1.json
  def update
    respond_to do |format|
      if @analise_privacidade.update(analise_privacidade_params)
        format.html { redirect_to @analise_privacidade, notice: 'Analise privacidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @analise_privacidade }
      else
        format.html { render :edit }
        format.json { render json: @analise_privacidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analise_privacidades/1
  # DELETE /analise_privacidades/1.json
  def destroy
    @analise_privacidade.destroy
    respond_to do |format|
      format.html { redirect_to analise_privacidades_url, notice: 'Analise privacidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analise_privacidade
      @analise_privacidade = AnalisePrivacidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analise_privacidade_params
      #params.require(:analise_privacidade).permit(:rede_social, :url_rede_social, :descricao_analise, tipo_coumunicacoes_attributes: [:id, :tipo_comunicacao, :observacao])
      
      
      params.require(:analise_privacidade).permit!
      
      
      
      
      
    end
end
