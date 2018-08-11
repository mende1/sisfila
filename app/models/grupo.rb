class Grupo < ApplicationRecord
  has_and_belongs_to_many :alunos
  acts_as_list column: :prioridade
  belongs_to :fila
end
