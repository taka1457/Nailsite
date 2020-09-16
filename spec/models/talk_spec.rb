require 'rails_helper'

RSpec.describe 'Talkモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Talk.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Talk.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
    context 'TalkRoomモデルとの関係' do
      it 'N:1となっている' do
        expect(Talk.reflect_on_association(:talk_room).macro).to eq :belongs_to
      end
    end
  end
end