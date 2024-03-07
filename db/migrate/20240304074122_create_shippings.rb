class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building_name
      t.string     :phone_number,  null: false
      t.references :buy,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
