class TipoComunicacoesController < ApplicationController
  before_action :set_tipo_comunicacao, only: [:show, :edit, :update, :destroy]

  # GET /tipo_comunicacoes
  # GET /tipo_comunicacoes.json
  def index
    @tipo_comunicacoes = TipoComunicacao.where(:analise_privacidade_id =>  params[:format].to_i)    
  end

  # GET /tipo_comunicacoes/1
  # GET /tipo_comunicacoes/1.json
  def show
  end

  # GET /tipo_comunicacoes/new
  def new
  
    
    @tipo_comunicacao = TipoComunicacao.new
    @tipo_comunicacao.build_analise_privacidade(:id => params[:analise_privacidade_id].to_i)
    
    
    #@tipo_comunicacao.analise_privacidade_build
    
    8.times {
      @tipo_comunicacao.modelagem_privacidades.build  
    }
    
    #render :text => params[:analise_privacidade_id].to_i
    
  end

  # GET /tipo_comunicacoes/1/edit
  def edit
  end

  # POST /tipo_comunicacoes
  # POST /tipo_comunicacoes.json
  def create
    @tipo_comunicacao = TipoComunicacao.new(tipo_comunicacao_params)

    respond_to do |format|
      if @tipo_comunicacao.save
        format.html { redirect_to @tipo_comunicacao, notice: 'Tipo comunicacao was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_comunicacao }
      else
        format.html { render :new }
        format.json { render json: @tipo_comunicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_comunicacoes/1
  # PATCH/PUT /tipo_comunicacoes/1.json
  def update
    respond_to do |format|
      if @tipo_comunicacao.update(tipo_comunicacao_params)
        format.html { redirect_to @tipo_comunicacao, notice: 'Tipo comunicacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_comunicacao }
      else
        format.html { render :edit }
        format.json { render json: @tipo_comunicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_comunicacoes/1
  # DELETE /tipo_comunicacoes/1.json
  def destroy
    @tipo_comunicacao.destroy
    respond_to do |format|
      format.html { redirect_to tipo_comunicacoes_url, notice: 'Tipo comunicacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_comunicacao
      @tipo_comunicacao = TipoComunicacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_comunicacao_params
      #params.require(:tipo_comunicacao).permit(:analise_privacidade_attributes, :rede_social, :analise_privacidades_id, :tipo_comunicacao, :observacao)
       params.require(:tipo_comunicacao).permit!
    end
end
