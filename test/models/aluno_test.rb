require 'test_helper'

class AlunoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
