class AddRolIdToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :rol_id, :integer, default: 0
    add_index :usuarios, :rol_id
  end
end
