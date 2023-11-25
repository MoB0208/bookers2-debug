class RenamePostCommentToBookComment < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_comment, :book_comment
  end
end
