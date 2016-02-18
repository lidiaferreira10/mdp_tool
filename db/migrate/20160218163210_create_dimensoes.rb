class CreateDimensoes < ActiveRecord::Migration
  def change
    create_table :dimensoes do |t|
      
      t.references :categoria_dimensoes, index: true
      t.string :nome_dimensao, null: false
      t.string :codigo_dimensao
      t.text :descricao_dimensao
      t.text :significado_nivel_privacidade

      t.timestamps null: false
    end
  end
end
