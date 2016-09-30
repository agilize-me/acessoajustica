class CasoMailer < ApplicationMailer
  default from: 'noreplyparajas@gmail.com'

  def feed_de_casos(user, atualizacao)
    @user = user
    @atualizacao = atualizacao

    mail(to: @user.email, subject: 'Intimações do dia ' + atualizacao[:date])
  end

  def feed_de_estagiarios(user, atualizacao)
    @user = user
    @atualizacao = atualizacao

    mail(to: @user.email, subject: 'Atualizações de processos dos estagiários ' + atualizacao[:date])
  end
end
