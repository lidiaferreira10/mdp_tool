class ValorDimensao < ActiveRecord::Base
  belongs_to :dimensao
  belongs_to :nivel_privacidade
  has_many :modelagem_privacidades
  has_many :modelagem_privacidades, :through => :recomendacao_valores
end
