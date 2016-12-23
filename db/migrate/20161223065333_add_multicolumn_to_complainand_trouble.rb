class AddMulticolumnToComplainandTrouble < ActiveRecord::Migration
  def change
    add_column :complains, :complain_type, :string
    add_column :complains, :solve_method, :string
    add_column :complains, :solve_people, :string
    add_column :troubles, :customer_company, :string
    add_column :troubles, :customer_address, :string
    add_column :troubles, :contract_id, :string
    add_column :troubles, :product_type, :string
    add_column :troubles, :product_id, :string
  end
end
