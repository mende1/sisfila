class Colegiado < ApplicationRecord
  has_many :alunos
  has_many :filas

  def proxima_fila_nao_vazia
    self.filas.order(prioridade: :asc).each do |fila|
      if fila.posicao < fila.vagas.count
        return fila
      end
    end
    return nil
  end

  def title
    "#{self.nome}"
  end
end

# == Schema Information
#
# Table name: colegiados
#
#  id         :integer          not null, primary key
#  codigo     :string
#  nome       :string
#  sigla      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
