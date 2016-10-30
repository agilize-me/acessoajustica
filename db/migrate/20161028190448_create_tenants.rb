class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :nome, null: false, unique: true
      t.string :subdomain, null: false, unique: true

      t.timestamps null: false
    end
  end
end
