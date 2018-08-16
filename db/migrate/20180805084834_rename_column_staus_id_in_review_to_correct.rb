class RenameColumnStausIdInReviewToCorrect < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :staus_id, :status_id
  end
end
