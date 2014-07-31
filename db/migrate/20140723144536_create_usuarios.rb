class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :password_digest
      t.integer :tipo_usuario, default: nil
      #t.string :remember_token

      t.timestamps
    end
  end
end
