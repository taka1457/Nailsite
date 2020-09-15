require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:genre) { build(:genre) }
    subject { test_genre.valid? }
    let(:test_genre) { genre }
    context 'nameカラム' do
      it '空欄でないこと' do
        test_genre.name = ''
        is_expected.to eq false;
      end
    end
    context 'is_void_flagカラム' do
      it '空欄でないこと' do
        test_genre.is_void_flag = ''
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:shops).macro).to eq :has_many
      end
    end
  end
end