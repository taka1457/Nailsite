require 'rails_helper'

RSpec.describe 'ImgSearchモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'SearchTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(ImgSearch.reflect_on_association(:search_tags).macro).to eq :has_many
      end
    end
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(ImgSearch.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end