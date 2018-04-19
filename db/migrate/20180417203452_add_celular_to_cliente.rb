class AddCelularToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :telefone_celular, :string
  end
end
