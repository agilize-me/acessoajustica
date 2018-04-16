class VareirosController < ApplicationController
  authorize_resource
  before_action :set_vareiro, only: [:show, :edit, :update, :destroy, :active]

  # GET /vareiros
  # GET /vareiros.json
  def index
    @vareiros = Vareiro.all.joins(:membro).joins(:user).order("users.active DESC").order("users.last_sign_in_at DESC")
  end

  # GET /vareiros/1
  # GET /vareiros/1.json
  def show
  end

  # GET /vareiros/new
  def new
    @vareiro = Vareiro.new
    @user_id = params[:user_id]
  end

  # GET /vareiros/1/edit
  def edit
  end

  # POST /vareiros/1/active
  def active
    @vareiro.membro.user.active = !@vareiro.membro.user.active
    @vareiro.membro.user.save
    redirect_to vareiros_path
  end

  # POST /vareiros
  # POST /vareiros.json
  def create
      @vareiro = Vareiro.new(vareiro_params.select { | key, value | key != "user_id" })

    respond_to do |format|
      if @vareiro.save
        @user = User.find(vareiro_params[:user_id])
        @user.membro_id = Membro.find_by( { :actable_type => "Vareiro", :actable_id => @vareiro.id } ).id;
        @user.save
        format.html { redirect_to @vareiro, notice: 'Vareiro was successfully created.' }
        format.json { render :show, status: :created, location: @vareiro }
      else
        @user_id = vareiro_params[:user_id]
        format.html { render :new }
        format.json { render json: @vareiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vareiros/1
  # PATCH/PUT /vareiros/1.json
  def update
    respond_to do |format|
      if @vareiro.update(vareiro_params)
        format.html { redirect_to @vareiro, notice: 'Vareiro was successfully updated.' }
        format.json { render :show, status: :ok, location: @vareiro }
      else
        format.html { render :edit }
        format.json { render json: @vareiro.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vareiro
      @vareiro = Vareiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vareiro_params
      params.require(:vareiro).permit(:forum, :ano_faculdade, :nome, :cpf,
                                      :nome_da_mae, :rg, :cor_id, :identidade_de_genero, :user_id)
    end
end
