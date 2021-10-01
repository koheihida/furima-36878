require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '各項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '画像が無いとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないとき' do
        @item.goode_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Goode name can't be blank")
      end
      it '商品の説明が無いとき' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリー未選択のとき' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be select")
      end
      it '商品状態未選択のとき' do
        @item.detail_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be select")
      end
      it '送料の負担が未選択のとき' do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be select")
      end
      it '発送元の地域が未選択のとき' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be select")
      end
      it '発送までの日数が未選択のとき' do
        @item.period_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Period date can't be select")
      end
      it '価格が空白のとき' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が規定より低額のとき' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が規定より高額のとき' do
        @item.price ="10000000000000000000000000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '全角では保存できないこと' do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '英字では保存できないこと' do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '英数字混合では保存できないこと' do
        @item.price = "aa1111"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐づいていなければ出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end 
end
