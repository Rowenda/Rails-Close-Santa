class AddUserReferencesToOffers < ActiveRecord::Migration[6.1]
  def change
    add_reference :offers, :user, foreign_key: true
  end
end
