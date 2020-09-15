require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Tag.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end