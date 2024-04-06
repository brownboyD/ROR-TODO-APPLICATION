class ChangeColumnDescription < ActiveRecord::Migration[7.0]
  def change
    change_column(:tasks, :description, :text)
  end
  def up
    change_column :tasks, :description, :text
  end

  def down
      change_column :tasks, :description, :string
  end

end
