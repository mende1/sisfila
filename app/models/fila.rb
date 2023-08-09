class Fila < ApplicationRecord
  acts_as_list column: :prioridade
  has_many :grupos
  has_many :vagas
  belongs_to :colegiado, required: true

  def vaga_atual
    self.vagas.find_by posicao: self.posicao
  end
  def proxima_vaga
    self.vagas.find_by posicao: self.posicao + 1
  end

  def chama_proximo(mesa_id, incremento=1)
    self.increment!(:posicao, incremento)
    Mesa.associa_vaga_a_mesa(self.vaga_atual, mesa_id)
  end

  def title
    "#{self.codigo}"
  end

  def shuffle
    posicoes = (1..(vagas.size)).to_a.shuffle
    self.vagas.each_with_index do |vaga, i|
      vaga.update(posicao: posicoes[i])
    end
  end
end

# == Schema Information
#
# Table name: filas
#
#  id           :integer          not null, primary key
#  ativo        :boolean          default(TRUE)
#  codigo       :string
#  nome         :string
#  posicao      :integer          default(1), not null
#  prioridade   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  colegiado_id :integer
#
# Indexes
#
#  index_filas_on_colegiado_id  (colegiado_id)
#
