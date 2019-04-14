class AddColumnToWhitelabelGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :registration_whitelabel_groups, :directory_community_id, :integer
  end
end
