class AddReplyIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :reply_id, :integer
  end
end
