class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.string :form_input

      t.timestamps null: false
    end
  end
end
