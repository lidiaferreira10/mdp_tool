class CreateValorDimensoes < ActiveRecord::Migration
  def change
    create_table :valor_dimensoes do |t|
      t.references :dimensoes, index: true
      t.references :nivel_privacidades, index: true
      t.string :valor, null:false
      t.text :descricao_valor

      t.timestamps null: false
    end
  end
end
