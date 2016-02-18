class CreateNivelPrivacidades < ActiveRecord::Migration
  def change
    create_table :nivel_privacidades do |t|
      t.string :nivel_privacidade, null: false
      t.integer :nivel

      t.timestamps null: false
    end
  end
end
