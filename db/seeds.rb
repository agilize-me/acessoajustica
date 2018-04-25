# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

puts 'seeding...'

# IMPORTANT: seeds run again after the creation of a new tenant.
# So be careful! Creating a tenant might duplicate data!
# First, we create ixdeagosto and add users.
 if Apartment::Tenant.current == "public"
   unless Apartment.tenant_names.include? "ixdeagosto"
     Tenant.create! nome:"IX de Agosto", subdomain:"ixdeagosto"
     puts 'created tenant "IX de Agosto"'
     Tenant.find_by(subdomain:"ixdeagosto").switch!
     puts 'switched to tenant "IX de Agosto"'
   end
 end

# Tenant.find_by(subdomain:"ixdeagosto").switch!

# Creating estado_civil's
EstadoCivil.find_or_create_by!(:description => "Solteiro")
EstadoCivil.find_or_create_by!(:description => "Casado")
EstadoCivil.find_or_create_by!(:description => "Separação de Fato")
EstadoCivil.find_or_create_by!(:description => "Separação Judicial")
EstadoCivil.find_or_create_by!(:description => "Viúvo")
EstadoCivil.find_or_create_by!(:description => "Vive em União Estável")

# Creating profissao's
ProfissaoType.find_or_create_by!(:description => "Registrado")
ProfissaoType.find_or_create_by!(:description => "Informal")
ProfissaoType.find_or_create_by!(:description => "Aposentado")
ProfissaoType.find_or_create_by!(:description => "Desempregado")

# Creating atendimento_types
AtendimentoType.find_or_create_by!(:description => "Orientação Apenas")
AtendimentoType.find_or_create_by!(:description => "Orientação Cancelada")
AtendimentoType.find_or_create_by!(:description => "Mediação")
AtendimentoType.find_or_create_by!(:description => "Caso")

# Creating roles.
admin_role      = Role.find_or_create_by!(:name => "admin")
diretor_role    = Role.find_or_create_by!(:name => "diretor")
vareiro_role    = Role.find_or_create_by!(:name => "vareiro")
calouro_role    = Role.find_or_create_by!(:name => "calouro")
estagiario_role = Role.find_or_create_by!(:name => "estagiário")

admin_user = User.create(:email=>'test@test.com',:username=>'admin',:password=>'password')
admin_user.roles << admin_role

# Creating moradia_types
MoradiaType.find_or_create_by!(:description => "Morador de Rua")
MoradiaType.find_or_create_by!(:description => "Aluguel / Pensão")
MoradiaType.find_or_create_by!(:description => "Moradia Irregular")
MoradiaType.find_or_create_by!(:description => "Própria")
MoradiaType.find_or_create_by!(:description => "Cedida")
MoradiaType.find_or_create_by!(:description => "Outra")

#Create cor_type
branco = Cor.find_or_create_by!(:description => "Branco")
preto = Cor.find_or_create_by!(:description => "Preto")
pardo = Cor.find_or_create_by!(:description => "Pardo")
amarelo = Cor.find_or_create_by!(:description => "Amarelo")
vermelho = Cor.find_or_create_by!(:description => "Vermelho")

#Creating especialidades
Especialidade.find_or_create_by!(:description => "Cível");
Especialidade.find_or_create_by!(:description => "Família");
Especialidade.find_or_create_by!(:description => "Penal");
Especialidade.find_or_create_by!(:description => "Previdenciário");
Especialidade.find_or_create_by!(:description => "Trabalhista");
Especialidade.find_or_create_by!(:description => "Tributário");
Especialidade.find_or_create_by!(:description => "N/D");


case Rails.env
 when "development"
    # Creating admin users
    estagiario_user = User.create(:email=>'estagiario@test.com',:username=>'estagiario',:password=>'password')
    calouro_user    = User.create(:email=>'calouro@test.com',:username=>'calouro',:password=>'password')
    vareiro_user    = User.create(:email=>'vareiro@test.com',:username=>'vareiro',:password=>'password')
    diretor_user    = User.create(:email=>'diretor@test.com',:username=>'diretor',:password=>'password')

    # assign the admin role to the admin user.  (This bit of rails
    # magic creates a user_role record in the database.)
    estagiario_user.roles << estagiario_role
    calouro_user.roles << calouro_role
    vareiro_user.roles << vareiro_role
    diretor_user.roles << diretor_role

     # Creating cliente
     cliente = Cliente.find_or_create_by!(:nome => "João da Silva",
               :cpf  => "123.456.789-00",
               :nome_da_mae => "Maria da Penha",
               :rg  => "12.345.678-9",
               :identidade_de_genero => "Homem",
               :familia_renda  => 1500.00,
               :profissao_nome  => "Assistente Administrativo",
               :familia_quantidade => 9,
               :contribuintes_quantidade => 4,
               :aprovado => true)

      cliente.cor = preto
      cliente.save

     estagiario = Estagiario.create!(:nome => "Joana Silveira ",
                                                :cpf =>"123.456.789-02",
                                                :nome_da_mae  =>  "Maria da Silva",
                                                :rg  => "12.345.678-3",
                                                :identidade_de_genero  => "Homem",
                                                :ano_faculdade  => "1991-03-02",
                                                :cor => amarelo)

     estagiario_user.membro_id = estagiario.membro.id
     estagiario_user.save

     estagiario_diretor = Estagiario.create!(:nome => "Joana Diretora",
               :cpf =>"123.456.789-01",
               :nome_da_mae  =>  "Maria Diretora",
               :rg  => "12.345.678-0",
               :identidade_de_genero  => "Mulher",
               :ano_faculdade  => "1991-03-02",
               :cor => vermelho)

     diretor_membro = Membro.where(:actable_id => estagiario_diretor.id, :actable_type => "Estagiario").first
     diretor_user.membro_id = diretor_membro.id
     diretor_user.save

     calouro = Calouro.create!(:nome => "Devon Carter",
                                          :cpf => "009029125213",
                                          :nome_da_mae => "Clayton Hammond",
                                          :rg => "850470618",
                                          :identidade_de_genero => "Homem",
                                          :ano_faculdade => "2017-02-14",
                                          :cor => vermelho)

     calouro_user.membro_id = calouro.membro.id
     calouro_user.save

     vareiro = Vareiro.create!(:nome => "Alice White",
                                          :cpf => "12343289700",
                                          :nome_da_mae => "Fernanda Brown",
                                          :rg => "235869834",
                                          :identidade_de_genero => "Mulher",
                                          :forum => "AAA",
                                          :ano_faculdade => "2017-02-14",
                                          :cor => branco)

     vareiro_user.membro_id = vareiro.membro.id
     vareiro_user.save

     resultado_type = AtendimentoResultado.find_or_create_by!(:description => "Orientação")

     # Creating atendimento
     atendimento1 = Atendimento.find_or_create_by!(:status => true,
                                                   :cliente => cliente,
                                                   :initial_description => 'Relato inicial.')

     atendimento2 = Atendimento.find_or_create_by!(:status => false,
                                                   :cliente => cliente,
                                                   :initial_description => 'Relato inicial.')

     atendimento3 = Atendimento.find_or_create_by!(:status => true,
                                                   :cliente => cliente,
                                                   :initial_description => 'Relato inicial.',
                                                   :estagiario => estagiario,
                                                   :atendimento_resultado => resultado_type)



     cliente2 = Cliente.find_or_create_by!( :nome => "Abreu da Silva Sauro",
               :cpf  =>"123.456.789-00",
               :nome_da_mae => "Maria da Penha",
               :rg  => "12.345.678-9",
               :identidade_de_genero => "Homem",
               :familia_renda  => 1500.00,
               :profissao_nome  =>"Assistente Administrativo",
               :familia_quantidade => 9,
               :contribuintes_quantidade => 4,
               :aprovado => true)

    cliente2.cor = branco
    cliente2.save

     # Creating atendimento
     atendimento4 = Atendimento.find_or_create_by!(:status => true,
                                                   :cliente => cliente2,
                                                   :initial_description => "Relato inicial.")
end
