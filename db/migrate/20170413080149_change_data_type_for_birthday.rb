class ChangeDataTypeForBirthday < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :birthday
    add_column :users, :birthday, :date
  end
end
