class AddAttachementToBids < ActiveRecord::Migration
  def change
    add_column :bids, :attachement, :string
  end
end
