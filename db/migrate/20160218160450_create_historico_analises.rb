class CreateHistoricoAnalises < ActiveRecord::Migration
  def change
    create_table :historico_analises do |t|
      t.references :users, index: true
      t.references :analise_privacidades, index: true
      t.datetime :data_analise
      t.timestamps null: false
    end
  end
end
