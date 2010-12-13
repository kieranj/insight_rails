class LinkUsersToCRMContacts < ActiveRecord::Migration
  
  def self.up
    add_column :users, :crm_id, :integer
    add_column :accounts, :crm_id, :integer
  end
  
  def self.down
    remove_column :users, :crm_id
    remove_column :accounts, :crm_id
  end
  
end