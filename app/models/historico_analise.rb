class HistoricoAnalise < ActiveRecord::Base
  belongs_to :user
  belongs_to :analise_privacidade
end
