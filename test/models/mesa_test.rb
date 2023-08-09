require 'test_helper'

class MesaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
