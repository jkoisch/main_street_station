class CreateRegistrationWhitelabels < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_whitelabels do |t|
      t.string :name
      t.text :description
      t.integer :contact_id
      t.string :contact_phone
      t.text :address1
      t.text :address2
      t.string :city
      t.string :state
      t.string :zip_postal_code
      t.string :work_phone
      t.string :email_primary

      t.timestamps
    end
  end
end
