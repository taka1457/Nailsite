require 'rails_helper'

RSpec.describe 'TalkRoomモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'TalkRoomsモデルとの関係' do
      it '1:Nとなっている' do
        expect(TalkRoom.reflect_on_association(:talk_rooms).macro).to eq :has_many
      end
    end
    context 'Talkモデルとの関係' do
      it '1:Nとなっている' do
        expect(TalkRoom.reflect_on_association(:talks).macro).to eq :has_many
      end
    end
  end
end