class ChangeAttachmentNameInBid < ActiveRecord::Migration
  def change
    rename_column :bids, :attachement, :attachment
  end
end
