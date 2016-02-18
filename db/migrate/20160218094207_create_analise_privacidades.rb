class CreateAnalisePrivacidades < ActiveRecord::Migration
  def change
    create_table :analise_privacidades do |t|
      t.string :rede_social
      t.string :url_rede_social, null: true
      t.text :descricao_analise, null: true

      t.timestamps null: false
    end
  end
end
