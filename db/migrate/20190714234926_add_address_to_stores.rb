class AddAddressToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :address, :string
  end
end
