class AnalisePrivacidade < ActiveRecord::Base
  has_many :tipo_comunicacoes
  has_many :historico_analises
  has_many :users, :through => :historico_analises
  accepts_nested_attributes_for :tipo_comunicacoes
end
