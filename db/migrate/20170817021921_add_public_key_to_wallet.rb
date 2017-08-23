class AddPublicKeyToWallet < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :public_key, :string
  end
end
