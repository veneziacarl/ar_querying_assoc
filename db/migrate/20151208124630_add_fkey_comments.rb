class AddFkeyComments < ActiveRecord::Migration
  def change
    add_reference :comments, :recipe, index: true
  end
end
