json.array!(@tipo_comunicacoes) do |tipo_comunicacao|
  json.extract! tipo_comunicacao, :id, :Analise_Privacidade_id, :tipo_comunicacao, :observacao
  json.url tipo_comunicacao_url(tipo_comunicacao, format: :json)
end
