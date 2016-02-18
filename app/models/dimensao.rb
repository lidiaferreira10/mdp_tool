class Dimensao < ActiveRecord::Base
  belongs_to :categoria_dimensoes
  has_many :valor_dimensoes
  has_many :modelagem_privacidades
end
