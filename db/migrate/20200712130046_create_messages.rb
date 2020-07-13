class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :recipient, index: true
      t.references :sender, index: true

      t.timestamps
    end
  end
end
