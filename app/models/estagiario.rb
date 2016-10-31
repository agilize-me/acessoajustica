class Estagiario < ActiveRecord::Base
has_and_belongs_to_many :especialidades, :join_table => :estagiarios_especialidades

acts_as :membro

  def is_diretor
    @users = User.all.joins(:roles).joins(:membro).where("roles.name = 'diretor'")
    self.membro.user.id.in?(@users.ids)
  end
end
