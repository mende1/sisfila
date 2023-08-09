class Grupo < ApplicationRecord
  has_and_belongs_to_many :alunos
  acts_as_list column: :prioridade
  belongs_to :fila, required: false

  def title
    "#{self.nome} (#{self.prioridade})"
  end
end

# == Schema Information
#
# Table name: grupos
#
#  id         :integer          not null, primary key
#  ativo      :boolean          default(TRUE)
#  nome       :string
#  prioridade :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fila_id    :integer
#
# Indexes
#
#  index_grupos_on_fila_id  (fila_id)
#
