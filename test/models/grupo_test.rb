require 'test_helper'

class GrupoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
