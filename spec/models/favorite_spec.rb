require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end