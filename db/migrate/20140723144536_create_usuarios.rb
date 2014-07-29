class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :password_digest
      t.string :tipo_usuario, default: nil
      t.references :medico, default: 0
      t.references :centro_salud, default: 0
      #t.string :remember_token

      t.timestamps
    end
  end
end
