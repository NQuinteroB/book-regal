class ChangeAvailabilityToBooks < ActiveRecord::Migration[7.0]
  def change
change_column :books, :availability, :boolean, :default =>true
#Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
