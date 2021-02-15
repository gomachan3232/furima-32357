require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy_form = FactoryBot.build(:buy_form, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'post_code,prefecture_id,city,address,phone_number,token,item_id,user_idがあれば購入できる' do
        expect(@buy_form).to be_valid
      end
      it 'post_codeが3文字ハイフン4文字だと購入できる' do
        @buy_form.post_code = '123-4567'
        expect(@buy_form).to be_valid
      end
      it 'buildingがなくても購入できる' do
        @buy_form.building = ''
        expect(@buy_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeがないと購入できない' do
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idがないと購入できない' do
        @buy_form.prefecture_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityがないと購入できない' do
        @buy_form.city = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがないと購入できない' do
        @buy_form.address = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがないと購入できない' do
        @buy_form.phone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @buy_form.post_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが4文字ハイフン3文字だと購入できない' do
        @buy_form.post_code = '1234-567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Post code is invalid')
      end
      it 'phone_numberが11桁以上だと購入できない' do
        @buy_form.phone_number = '123456789012'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンが入っていると購入できない' do
        @buy_form.phone_number = '090-123-456'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenがないと購入できない' do
        @buy_form.token = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idがないと購入できない' do
        @buy_form.item_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idがないと購入できない' do
        @buy_form.user_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
