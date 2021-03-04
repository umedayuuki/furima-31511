require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @order = FactoryBot.build(:purchase_shipping_address, user_id: FactoryBot.create(:user).id,
                                                          item_id: FactoryBot.create(:item).id)
    sleep(0.5)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'postalcode、munitipalities、address、phonenumber、area_id、tokenが存在すれば出品できる' do
        expect(@order).to be_valid
      end
      it 'postalcodeにハイフンがあれば購入できる' do
        @order.postalcode = '514-0101'
        expect(@order).to be_valid
      end
      it 'phonenumberにはハイフンがなく11桁以内であれば購入できる' do
        @order.phonenumber = '08089760877'
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it 'postalcodeが空では出品できない' do
        @order.postalcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'munitipalitiesが空では出品できない' do
        @order.munitipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Munitipalities can't be blank")
      end
      it 'addressが空では出品できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空では出品できない' do
        @order.phonenumber = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'tokenが空では出品できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'area_idが1では出品できない' do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Area must be other than 1')
      end
      it 'postalcodeにハイフンがなければ出品できない' do
        @order.postalcode = '5140101'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postalcode is invalid')
      end
      it 'phonenumberにハイフンがあると出品できない' do
        @order.phonenumber = '080-8976-0877'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'phonenumberが11桁より多ければ出品できない' do
        @order.phonenumber = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phonenumber is invalid')
      end
    end
  end
end
