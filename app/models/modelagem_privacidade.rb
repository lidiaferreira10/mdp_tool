class ModelagemPrivacidade < ActiveRecord::Base
  belongs_to :dimensoes
  belongs_to :controle_privacidades
  belongs_to :tipo_comunicacoes
  has_many :recomendacao_valores
  has_many :valor_dimensoes, :through => :recomendacao_valores
  accepts_nested_attributes_for :tipo_comunicacoes, :dimensoes
end
