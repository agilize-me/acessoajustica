class CreateCor < ActiveRecord::Migration
  def change
    create_table :cors do |t|
      t.string :description
    end
  end
end
