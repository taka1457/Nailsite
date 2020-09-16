require 'rails_helper'

RSpec.describe 'Bookmarkモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Bookmark.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Bookmark.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end