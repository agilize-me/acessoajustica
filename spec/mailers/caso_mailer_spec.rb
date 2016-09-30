require "rails_helper"

RSpec.describe CasoMailer, type: :mailer do

  let(:user) { FactoryGirl.create(:user) }
  let(:mail_to_estagiario) { described_class.feed_de_casos(user, atualizacao_estagiario).deliver_now }
  let(:mail_to_diretor) { described_class.feed_de_estagiarios(user, atualizacao_diretor).deliver_now }
  let(:atualizacao_estagiario) {
    {
      date: Time.new(2016,9,16).strftime("%d/%m/%Y"),
      casos: [
          {
              id: 42,
              nome_cliente: 'Fulano',
              processos_update: [
                  {
                    processo_id: 1,
                    processo_numero: "0011953-02.2016.8.26.0001",
                    diario_oficial: 'TJ-SP',
                    caderno: 'Judicial - 1ª Instância - Capital',
                    secao: 'Fóruns Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi Cível 4ª Vara da Família e Sucessões',
                    pagina: 1899,
                    atualizacao: 
                      'Processo 0011953-02.2016.8.26.0001 (processo principal 0027902-08.2012.8.26) - Cumprimento de sentença - Revisão - Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de satisfação de verba alimentar, dotada de peculiaridades prestações continuadas, com períodos e ritos diversos - e visando inclusive o célere processamento, proceda o interessado à distribuição de execução autônoma por dependência a este Juízo. Int. - ADV: LEANDRO ANDRÉ FRANCISCO LIMA (OAB 183134/SP), FERNANDO MANGIANELLI BEZZI (OAB 299878/SP), CAMILA MOURA (OAB 299825/SP)'
                  },
              ]
          },
          {
              id: 1789,
              nome_cliente: 'Goldman',
              processos_update: [
                  {
                    processo_id: 7,
                    processo_numero: "346/2016",
                    diario_oficial: 'DOM-SP',
                    caderno: 'Normal',
                    secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                    pagina: 50,
                    atualizacao: 
                      'Aviso de 29-7-2016 Nº 346/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Nor- mativo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de AGOSTO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 3, 10, 17, 24 E 31: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes (Republicada por necessidade de retificação ? doe de 30-07-2016)'
                  },
                  {
                    processo_id: 13,
                    processo_numero: "389/2016",
                    diario_oficial: 'DOM-SP',
                    caderno: 'Normal',
                    secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                    pagina: 57,
                    atualizacao: 
                      'Aviso de 1-9-2016 nº 389/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Norma- tivo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de SETEMBRO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 14, 21 E 28: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes'
                  }
              ]
          }
      ]
    }
  }

  let(:atualizacao_diretor)
    {
      date: Time.new(2016,9,16).strftime("%d/%m/%Y"),
      estagiarios: [
      {
        nome: 'Fulano',
        id: 1,
        casos: [
            {
                id: 42,
                nome_cliente: 'Fulano',
                processos_update: [
                    {
                      processo_id: 1,
                      processo_numero: "0011953-02.2016.8.26.0001",
                      diario_oficial: 'TJ-SP',
                      caderno: 'Judicial - 1ª Instância - Capital',
                      secao: 'Fóruns Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi Cível 4ª Vara da Família e Sucessões',
                      pagina: 1899,
                      atualizacao: 
                        'Processo 0011953-02.2016.8.26.0001 (processo principal 0027902-08.2012.8.26) - Cumprimento de sentença - Revisão - Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de satisfação de verba alimentar, dotada de peculiaridades prestações continuadas, com períodos e ritos diversos - e visando inclusive o célere processamento, proceda o interessado à distribuição de execução autônoma por dependência a este Juízo. Int. - ADV: LEANDRO ANDRÉ FRANCISCO LIMA (OAB 183134/SP), FERNANDO MANGIANELLI BEZZI (OAB 299878/SP), CAMILA MOURA (OAB 299825/SP)'
                    },
                ]
            },
            {
                id: 1789,
                nome_cliente: 'Goldman',
                processos_update: [
                    {
                      processo_id: 7,
                      processo_numero: "346/2016",
                      diario_oficial: 'DOM-SP',
                      caderno: 'Normal',
                      secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                      pagina: 50,
                      atualizacao: 
                        'Aviso de 29-7-2016 Nº 346/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Nor- mativo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de AGOSTO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 3, 10, 17, 24 E 31: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes (Republicada por necessidade de retificação ? doe de 30-07-2016)'
                    },
                    {
                      processo_id: 13,
                      processo_numero: "389/2016",
                      diario_oficial: 'DOM-SP',
                      caderno: 'Normal',
                      secao: 'MINISTÉRIO PÚBLICO III - AVISOS',
                      pagina: 57,
                      atualizacao: 
                        'Aviso de 1-9-2016 nº 389/2016 ? PGJ O Procurador-Geral de Justiça, no uso de suas atribuições normais, PUBLICA, nos termos do artigo 4º, § 1º, do Ato Norma- tivo 965/2016-PGJ, a Escala de Participação nas Audiências de Custódia do Interior, referente ao mês de SETEMBRO de 2016. 3ª CIRCUNSCRIÇÃO JUDICIÁRIA - SANTO ANDRÉ DIAS 14, 21 E 28: Manuela Schreiber Silva e Sousa Marcelo Santos Nunes'
                    }
                ]
            }]
      },
      {
        nome: 'Cicrano',
        id: 2,
        casos: [
          {
              id: 57,
              nome_cliente: 'Bilbo',
              processos_update: [
                  {
                    processo_id: 39,
                    processo_numero: "0011953-02.2016.8.26.0001",
                    diario_oficial: 'TJ-SP',
                    caderno: 'Judicial - 1ª Instância - Capital',
                    secao: 'Fóruns Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi Cível 4ª Vara da Família e Sucessões',
                    pagina: 1899,
                    atualizacao: 
                      'Processo 0011953-02.2016.8.26.0001 (processo principal 0027902-08.2012.8.26) - Cumprimento de sentença - Revisão - Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de satisfação de verba alimentar, dotada de peculiaridades prestações continuadas, com períodos e ritos diversos - e visando inclusive o célere processamento, proceda o interessado à distribuição de execução autônoma por dependência a este Juízo. Int. - ADV: LEANDRO ANDRÉ FRANCISCO LIMA (OAB 183134/SP), FERNANDO MANGIANELLI BEZZI (OAB 299878/SP), CAMILA MOURA (OAB 299825/SP)'
                  }]
          }]
      }]
    }


  #First teste family: mail_to_estagiario
  it 'renders the subject' do
    expect(mail_to_estagiario.subject).to eq('Intimações do dia ' + atualizacao[:date])
  end

  it 'renders the receiver email' do
    expect(mail_to_estagiario.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail_to_estagiario.from).to eq(['noreplyparajas@gmail.com'])
  end

  it 'renders the caso id' do
    expect(mail_to_estagiario.body.encoded).to match("42")
    expect(mail_to_estagiario.body.encoded).to match("1789")
  end

  it 'renders the cliente name' do
    expect(mail_to_estagiario.body.encoded).to match("Fulano")
    expect(mail_to_estagiario.body.encoded).to match("Goldman")
  end

  it 'renders the processo ids' do
    expect(mail_to_estagiario.body.encoded).to match("1")
    expect(mail_to_estagiario.body.encoded).to match("7")
    expect(mail_to_estagiario.body.encoded).to match("13")
  end

  it 'renders the diario oficial' do
    expect(mail_to_estagiario.body.encoded).to match("TJ-SP")
    expect(mail_to_estagiario.body.encoded).to match("DOM-SP")
  end

  it 'renders the secao' do
    # expect(mail_to_estagiario.body.encoded).to match("Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi")
    # expect(mail_to_estagiario.body.encoded).to match("AVISOS")
  end

  it 'renders the atualizacao' do
    # expect(mail_to_estagiario.body.encoded).to match("Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de ")
  end

  #Now for mail_to_diretor

  it 'renders the subject' do
    expect(mail_to_diretor.subject).to eq('Atualizações de processos dos estagiários ' + atualizacao[:date])
  end

  it 'renders the receiver email' do
    expect(mail_to_diretor.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail_to_diretor.from).to eq(['noreplyparajas@gmail.com'])
  end

  it 'renders the estagiario name' do
    expect(mail_to_diretor.body.encoded).to match("Fulano")
    expect(mail_to_diretor.body.encoded).to match("Cicrano")
  end

  it 'renders the caso id' do
    expect(mail_to_diretor.body.encoded).to match("42")
    expect(mail_to_diretor.body.encoded).to match("57")
    expect(mail_to_diretor.body.encoded).to match("1789")
  end

  it 'renders the cliente name' do
    expect(mail_to_diretor.body.encoded).to match("Fulano")
    expect(mail_to_diretor.body.encoded).to match("Goldman")
    expect(mail_to_diretor.body.encoded).to match("Bilbo")
  end

  it 'renders the processo ids' do
    expect(mail_to_diretor.body.encoded).to match("1")
    expect(mail_to_diretor.body.encoded).to match("7")
    expect(mail_to_diretor.body.encoded).to match("13")
    expect(mail_to_diretor.body.encoded).to match("39")
  end

  it 'renders the diario oficial' do
    expect(mail_to_diretor.body.encoded).to match("TJ-SP")
    expect(mail_to_diretor.body.encoded).to match("DOM-SP")
  end

  it 'renders the secao' do
    # expect(mail_to_diretor.body.encoded).to match("Regionais e Distritais I - Santana, Casa Verde, Vila Maria e Tucuruvi")
    # expect(mail_to_diretor.body.encoded).to match("AVISOS")
  end

  it 'renders the atualizacao' do
    # expect(mail_to_diretor.body.encoded).to match("Julia Pereia de Oliveira - Marco Antonio Pereira da Silva - Vistos.Em se tratando de ")
  end
end
