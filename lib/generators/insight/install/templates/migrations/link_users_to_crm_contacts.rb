class LinkUsersToCrmContacts < ActiveRecord::Migration
  
  def self.up
    add_column :users, :crm_id, :integer
  end
  
  def self.down
    remove_column :users, :crm_id
  end
  
end