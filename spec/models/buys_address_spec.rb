require 'rails_helper'

RSpec.describe BuysAddress, type: :model do
  before do    
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buys_address, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題ない場合' do
    it "全ての項目が入力されていれば購入できる" do
      expect(@buy).to be_valid
    end

    it '建物名が空でも購入できる' do
      @buy.building = ""
      expect(@buy).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "user_idが空のとき" do
      @buy.user_id = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("User can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end

    it"item_idが空の時" do
      @buy.item_id  = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Item can't be blank")
    end

    it "postcodeが空の時" do
      @buy.postcode = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postcode can't be blank")
    end

    it "postcodeが全角の時" do
      @buy.postcode = "１２３-１２３４"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end

    it "postcodeに-が無い時" do
      @buy.postcode = "1231234"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it '住所の地域が未選択のとき' do
      @buy.prefectures_id = '1'
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefectures can't be select")
    end

    it '市区町村が空の時' do
      @buy.city = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空の時' do
      @buy.block = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Block can't be blank")
    end
    
    it '電話番号がからの時' do
      @buy.tel_number = ""
      @buy.valid? 
      expect(@buy.errors.full_messages).to include("Tel number can't be blank")
    end

    it '電話番号が全角' do
      @buy.tel_number  = "０９００８２８０８２８"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tel number Phone number is an invalid value")
    end

    it '電話番号の桁が足りない'do
    @buy.tel_number  = "0828"
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Tel number Phone number is an invalid value")
    end

    it '電話番号の桁が多い'do
    @buy.tel_number  = "0828082808280828"
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Tel number Phone number is an invalid value")
    end

    it '電話番号の桁に-がある'do
    @buy.tel_number  = "090-0828-0828"
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Tel number Phone number is an invalid value")
    end
  end
end

