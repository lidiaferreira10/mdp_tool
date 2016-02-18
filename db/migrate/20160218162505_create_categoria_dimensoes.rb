class CreateCategoriaDimensoes < ActiveRecord::Migration
  def change
    create_table :categoria_dimensoes do |t|
      t.string :categoria, null: false

      t.timestamps null: false
    end
  end
end
