require 'test_helper'

class FilaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
