json.array!(@analise_privacidades) do |analise_privacidade|
  json.extract! analise_privacidade, :id, :rede_social, :url_rede_social, :descricao_analise
  json.url analise_privacidade_url(analise_privacidade, format: :json)
end
