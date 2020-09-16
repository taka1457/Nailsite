require 'rails_helper'

RSpec.describe 'HistoryCommentモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'ReservationHistoryモデルとの関係' do
      it 'N:1となっている' do
        expect(HistoryComment.reflect_on_association(:reservation_history).macro).to eq :belongs_to
      end
    end
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(HistoryComment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end