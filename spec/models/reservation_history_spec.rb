require 'rails_helper'

RSpec.describe 'ReservationHistoryモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'reserveモデルとの関係' do
      it 'N:1となっている' do
        expect(ReservationHistory.reflect_on_association(:reserve).macro).to eq :belongs_to
      end
    end
    context 'Menuモデルとの関係' do
      it 'N:1となっている' do
        expect(ReservationHistory.reflect_on_association(:menu).macro).to eq :belongs_to
      end
    end
    context 'HistoryCommentモデルとの関係' do
      it 'N:1となっている' do
        expect(ReservationHistory.reflect_on_association(:history_comments).macro).to eq :has_many
      end
    end
  end
end