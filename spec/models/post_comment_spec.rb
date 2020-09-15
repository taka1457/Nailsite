require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:post_comment) { build(:post_comment) }
    subject { test_post_comment.valid? }
    let(:test_post_comment) { post_comment }
    context 'bodyカラム' do
      it '空欄でないこと' do
        test_post_comment.body = ''
        is_expected.to eq false;
      end
      it '140文字以下であること' do
        test_post_comment.body = Faker::Lorem.characters(number:141)
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end