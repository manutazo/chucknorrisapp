class CreateChucks < ActiveRecord::Migration[5.1]
  def change
    create_table :chucks do |t|

      t.timestamps
    end
  end
end
