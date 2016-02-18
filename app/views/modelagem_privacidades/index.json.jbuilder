json.array!(@modelagem_privacidades) do |modelagem_privacidade|
  json.extract! modelagem_privacidade, :id, :dimensoes_id, :valor_dimensoes_id, :controle_privacidades_id, :tipo_comunicacoes_id
  json.url modelagem_privacidade_url(modelagem_privacidade, format: :json)
end
