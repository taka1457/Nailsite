require 'rails_helper'

RSpec.describe 'Reserveモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Reserve.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'ReservationHistoryモデルとの関係' do
      it 'N:1となっている' do
        expect(Reserve.reflect_on_association(:reservation_histories).macro).to eq :has_many
      end
    end
  end
end