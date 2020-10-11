class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string
  end
  # uidとproviderの組み合わせでユーザーが一意に定まるようにUNIQUEインデックスを設定(https://techblog.gmo-ap.jp/2019/02/08/rails%E3%81%A7omniauth-twitter%E3%82%92%E5%88%A9%E7%94%A8%E3%81%97%E3%81%A6twitter%E8%AA%8D%E8%A8%BC%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B/)  
  add_index :users, [:provider, :uid], unique: true
end
