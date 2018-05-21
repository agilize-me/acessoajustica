class ClientesController < ApplicationController
  authorize_resource
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {render template: 'clientes/show.pdf.erb', pdf: 'formulario-socioeconomico'}
    end
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  def search
  end

  def search_result
    @search = Cliente.search(params[:search])
    render :search
  end
  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
    if @cliente.save
      format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
      format.json { render :show, status: :created, location: @cliente }
    else
      format.html { render :new }
      format.json { render json: @cliente.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def verifica_cpf
    pessoa = Pessoa.where(:cpf => params[:cpf])
    render json: pessoa
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
      # @pessoa = Pessoa.where(actable_type: "Cliente", actable_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:profissao_nome, :familia_quantidade, :familia_renda,
                                      :contribuintes_quantidade, :estado_civil_id, :moradia_type_id,
                                      :profissao_type_id, :endereco, :bairro,
                                      :cep, :cidade, :estado, :tem_filhos, :menores_moram_quantidades,
                                      :maiores_moram_quantidades, :faz_bicos, :salario, :contribuicao_valor,
                                      :alimentacao_despesa, :saude, :aluguel, :condominio, :agua, :luz, :gas,
                                      :telefone_despesa, :transporte, :educacao, :obrigacoes_judiciais,
                                      :financiamentos, :iptu, :total_despesas_fixas, :valor_liquido_rendimento_mensal,
                                      :codigo, :menores_nao_moram_quantidades, :maiores_nao_moram_quantidades,
                                      :telefone_contato, :aprovado, :telefone_celular, :nome, :cpf,
                                        :nome_da_mae, :rg, :cor_id, :identidade_de_genero, :aprovado)
    end

end
