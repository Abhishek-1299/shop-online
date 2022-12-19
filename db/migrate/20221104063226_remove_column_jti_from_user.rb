class RemoveColumnJtiFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :jti
    add_column :users, :jti, :string
    User.all.each {|user| user.update_column(:jti, SecureRandom.uuid)}
    change_column_null :users, :jti, false
    add_index :users, :jti, unique: true
  end
end
