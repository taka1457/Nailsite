require 'rails_helper'

RSpec.describe 'SearchTagモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'ImgSearchモデルとの関係' do
      it 'N:1となっている' do
        expect(SearchTag.reflect_on_association(:img_search).macro).to eq :belongs_to
      end
    end
  end
end