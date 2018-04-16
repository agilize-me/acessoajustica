module EstagiariosHelper
  def get_especialidades_helper(especialidades)
    unless especialidades
      especialidades = Especialidade.all
    end
    return especialidades.  collect {|especialidade| [especialidade.description, especialidade.id]}
  end
  def add_all_especialidades(estagiario, especialidades)
  	if especialidades
      new_especialidade = Array.new
      especialidades.each do |id|
        unless id.length  == 0 || id == 0 || id == "0"
           new_especialidade << Especialidade.find(id)
        end
      end
      estagiario.especialidades = new_especialidade
    end
  end
end
