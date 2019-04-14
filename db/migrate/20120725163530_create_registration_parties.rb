class CreateRegistrationParties < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_parties do |t|
      t.integer     :community_role_id
      t.text        :signature
      t.string      :address
      t.string      :invitation_status
      t.integer     :user_id
      t.boolean     :owner
      t.references  :registration_contracts

      t.timestamps
    end

    create_table :registration_contracts do |t|
      t.references  :communities
      t.string      :status
      t.string      :constraints

      t.timestamps
    end
  end
end
