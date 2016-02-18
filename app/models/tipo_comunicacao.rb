class TipoComunicacao < ActiveRecord::Base
  belongs_to :analise_privacidade
  has_many :modelagem_privacidades
end
