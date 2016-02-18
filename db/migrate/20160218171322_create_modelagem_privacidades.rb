class CreateModelagemPrivacidades < ActiveRecord::Migration
  def change
    create_table :modelagem_privacidades do |t|
      t.references :dimensoes, index: true
      t.references :controle_privacidades, index: true
      t.references :tipo_comunicacoes, index: true

      t.timestamps null: false
    end
  end
end
