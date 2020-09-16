require 'rails_helper'

RSpec.describe 'CustomerRoomモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'TalkRoomモデルとの関係' do
      it 'N:1となっている' do
        expect(CustomerRoom.reflect_on_association(:talk_room).macro).to eq :belongs_to
      end
    end
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(CustomerRoom.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end