class ChangeUserUsernameDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :username, "anonymous"
  end
end
