class UserEventRelation < ActiveRecord::Migration[5.2]
  def change
    change_table :eventos do |t|
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
