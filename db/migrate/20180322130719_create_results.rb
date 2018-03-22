class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
		t.text :results, array: true, default: []
	    t.belongs_to :search
      t.timestamps
    end
  end
end
