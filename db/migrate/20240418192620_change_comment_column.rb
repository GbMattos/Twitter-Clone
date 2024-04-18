class ChangeCommentColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :user_id, :bigint, null: true
  end
end
