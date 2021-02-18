require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'image、item_name、price、description、category_id、states_id、bueden_id、area_id、day_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格は半角数字で￥300〜￥9999999の間であれば出品できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not included in the list',
                                                      'Price is invalid')
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'states_idが1では出品できない' do
        @item.states_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('States must be other than 1')
      end
      it 'bueden_idが1では出品できない' do
        @item.bueden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Bueden must be other than 1')
      end
      it 'area_idが1では出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'day_idが1では出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '価格の範囲が￥300〜￥9999999の間以外では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が￥300〜￥9999999の間以外では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格は半角数字以外で入力すると出品できない' do
        @item.price = 'suuzi'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list', 'Price is not a number')
      end
      it '価格は半角数字以外で入力すると出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list', 'Price is not a number')
      end
    end
  end
end
