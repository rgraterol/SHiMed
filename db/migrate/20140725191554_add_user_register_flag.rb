class AddUserRegisterFlag < ActiveRecord::Migration
  def change
    add_column :usuarios, :register_flag, :string, default: 0
  end
end
