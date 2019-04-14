class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|

      t.timestamps
    end
  end
end