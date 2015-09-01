class CreatePayTypes < ActiveRecord::Migration
  def up
    create_table :pay_types do |t|
      t.string :name

      t.timestamps null: false
    end
		PayType.transaction do
			PayType.create(name: "Check")
			PayType.create(name: "Credit card")
			PayType.create(name: "Purchase order")
		end    
  end

  def down
  	drop_table :pay_types
  end
end
