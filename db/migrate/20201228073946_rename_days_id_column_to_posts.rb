class RenameDaysIdColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :days_id, :day_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
