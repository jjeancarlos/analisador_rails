class CreateAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :analyses do |t|
      t.string :filename
      t.integer :filesize_bytes
      t.string :sha256_hash, index: { unique: true }
      t.boolean :is_malicious
      t.text :analysis_report

      t.timestamps
    end
  end
end
