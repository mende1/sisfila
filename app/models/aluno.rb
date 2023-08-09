class Aluno < ApplicationRecord
  validates_uniqueness_of :matricula
  has_one :mesa
  has_and_belongs_to_many :grupos
  has_many :vagas
  belongs_to :colegiado, required: false

  def esta_em_algum_grupo
    self.grupos.where(ativo: true).order(prioridade: :asc).first != nil
  end

  # def primeiro_grupo_ativo
  #   self.grupos.where(ativo: true).order(prioridade: :asc).first
  # end

  def primeiro_grupo_ativo_com_fila_ativa
    filas = self.grupos\
      .where(ativo: true)\
      .where.not(fila: nil)\
      .order(prioridade: :asc).all
    
    filas_ativas = filas.to_a.select { |f| f.ativo }

    filas_ativas[0]
  end

  # retorna a posição futura mais próxima na fila mais prioritária
  def proxima_vaga
    Fila.where(ativo: true)
        .where(colegiado: self.colegiado)
        .order(prioridade: :asc).each do |fila|
      vagas = fila.vagas.order(posicao: :asc)
        .where(aluno: self)
        .where("posicao >= ?", fila.posicao)
        .limit(1)
      if not vagas.empty?
        vaga = vagas.first
        return vaga    
      end
    end
    
    return nil
  end

  def posicao_total
    vaga = proxima_vaga
    return -1 if not vaga
    return 0 if vaga.posicao == vaga.fila.posicao

    soma = 0
    Fila.where(ativo: true)
        .where(colegiado: self.colegiado)
        .where("prioridade < ?", vaga.fila.prioridade)
        .order(prioridade: :asc).each do |fila|
      diff = fila.vagas.last.posicao - fila.posicao
      soma += diff if diff > 0
    end

    diff = vaga.posicao - vaga.fila.posicao
    soma += diff if diff > 0

    soma
  end

  def inscreve
    if !ativo
      raise "Número de matrícula não encontrado. (Cód. de Erro: 99)"
    end
    if !esta_em_algum_grupo
      raise "Número de matrícula não encontrado. (Cód. de Erro: 42)"
    end
    
    grupo = primeiro_grupo_ativo_com_fila_ativa
    if !grupo
      raise "Matrícula não habilitada para este horário. (Cód. de Erro: 27)"
    end

    # Checa se aluno já está em alguma fila ativa
    vaga = proxima_vaga
    if vaga
      if vaga.posicao == vaga.fila.posicao
        raise "Já está na sua vez!"
      else
        raise "Você já estava na fila (posição: #{vaga.codigo})."
      end
    else
      # Caso contrário, adiciona à fila
      vaga = Vaga.create(aluno: self, fila: grupo.fila)
      InscricaoChannel.inscreve(vaga)
      return { aluno: vaga.aluno, posicao: "#{vaga.codigo}" }
    end
  end

  def title
    "#{self.nome} (#{self.matricula})"
  end
end

# == Schema Information
#
# Table name: alunos
#
#  id              :integer          not null, primary key
#  ativo           :boolean          default(TRUE)
#  fezPreMatricula :boolean          default(FALSE)
#  formando        :boolean          default(FALSE)
#  matricula       :string
#  nome            :string
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  colegiado_id    :integer
#
# Indexes
#
#  index_alunos_on_colegiado_id  (colegiado_id)
#  index_alunos_on_matricula     (matricula) UNIQUE
#
