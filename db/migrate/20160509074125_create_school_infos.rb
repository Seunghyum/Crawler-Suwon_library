class CreateSchoolInfos < ActiveRecord::Migration
  def change
    create_table :school_infos do |t|
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
