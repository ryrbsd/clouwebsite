class AddAuthorizedToSocietyRecuritment < ActiveRecord::Migration
  def change
    add_column :society_recuritments, :Authorized, :boolean, :default => false
  end
end
