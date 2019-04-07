class AddUserIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :user_id, :integer
  end
end
