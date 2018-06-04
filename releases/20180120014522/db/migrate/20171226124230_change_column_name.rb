class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :grapes, :logn_des, :long_des
  end
end
