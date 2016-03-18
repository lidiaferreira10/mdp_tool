class AnalisePrivacidade < ActiveRecord::Base
  has_many :tipo_comunicacoes, :dependent => :destroy
  has_many :historico_analises
  has_many :users, :through => :historico_analises
  accepts_nested_attributes_for :tipo_comunicacoes, :reject_if => lambda { |a| a[:tipo_comunicacao].blank? }, :allow_destroy => true
end
