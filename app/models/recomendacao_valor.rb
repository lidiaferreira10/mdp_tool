class RecomendacaoValor < ActiveRecord::Base
  belongs_to :modelagem_privacidades
  belongs_to :valor_dimensoes
end
