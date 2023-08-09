require 'test_helper'

class VagaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
