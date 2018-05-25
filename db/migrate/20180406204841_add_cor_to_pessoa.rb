class AddCorToPessoa < ActiveRecord::Migration
  def change
    add_reference :pessoas, :cor
    add_foreign_key :pessoas, :cors
  end
end
