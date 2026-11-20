class CreateCoreTables < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :time_zone, null: false, default: "America/Los_Angeles"
      t.timestamps
    end

    create_table :students do |t|
      t.string :name, null: false
      t.integer :credit_cents, null: false, default: 0
      t.timestamps
    end

    create_table :bookings do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.datetime :starts_at, null: false
      t.integer :duration_minutes, null: false
      t.integer :price_cents, null: false
      t.string :status, null: false, default: "confirmed"
      t.string :stripe_charge_id
      t.timestamps
    end
  end
end
