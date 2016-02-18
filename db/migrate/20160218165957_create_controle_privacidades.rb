class CreateControlePrivacidades < ActiveRecord::Migration
  def change
    create_table :controle_privacidades do |t|
      t.string :controle
      t.text :descricao_controle

      t.timestamps null: false
    end
  end
end
