class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string     :file
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :comments
  end
end
