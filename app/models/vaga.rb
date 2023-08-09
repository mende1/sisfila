class Vaga < ApplicationRecord
  belongs_to :aluno
  belongs_to :rodada, required: false # TODO: remover esta associação
  belongs_to :fila, required: true
  acts_as_list scope: :fila, column: :posicao

  def codigo
    "#{self.fila&.codigo}_#{self.posicao}"
  end

  def title
    "[#{self.codigo}] #{self.aluno&.nome}"
  end
end

# == Schema Information
#
# Table name: vagas
#
#  id           :integer          not null, primary key
#  data_chamada :datetime
#  posicao      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  aluno_id     :integer
#  fila_id      :integer
#  rodada_id    :integer
#
# Indexes
#
#  index_vagas_on_aluno_id   (aluno_id)
#  index_vagas_on_fila_id    (fila_id)
#  index_vagas_on_rodada_id  (rodada_id)
#
