require 'rails_helper'

RSpec.describe 'ShopRoomモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'TalkRoomモデルとの関係' do
      it 'N:1となっている' do
        expect(ShopRoom.reflect_on_association(:talk_room).macro).to eq :belongs_to
      end
    end
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(ShopRoom.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end