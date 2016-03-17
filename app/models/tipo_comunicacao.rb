class TipoComunicacao < ActiveRecord::Base
  belongs_to :analise_privacidade
  has_many :modelagem_privacidades
  accepts_nested_attributes_for :modelagem_privacidades, :analise_privacidade
end
