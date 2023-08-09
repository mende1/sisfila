class Mesa < ApplicationRecord
  belongs_to :vaga, required: false

  def self.associa_vaga_a_mesa(vaga, id_mesa)
    mesa_atual = Mesa.find_by id: id_mesa
    if mesa_atual
      mesa_atual.update(vaga: vaga)
    end
  end

  def esta_vazia?
    self.vaga.nil?
  end

  def title
    "#{self.nome}"
  end
end

# == Schema Information
#
# Table name: mesas
#
#  id         :integer          not null, primary key
#  ativo      :boolean          default(TRUE)
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aluno_id   :integer
#  vaga_id    :integer
#
# Indexes
#
#  index_mesas_on_aluno_id  (aluno_id)
#  index_mesas_on_vaga_id   (vaga_id)
#
