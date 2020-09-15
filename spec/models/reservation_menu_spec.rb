require 'rails_helper'

RSpec.describe 'ReservationMenuモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(ReservationMenu.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Menuモデルとの関係' do
      it 'N:1となっている' do
        expect(ReservationMenu.reflect_on_association(:menu).macro).to eq :belongs_to
      end
    end
  end
end