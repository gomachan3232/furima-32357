require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @buy_form = FactoryBot.build(:buy_form)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'post_code,prefecture_id,city,address,phone_number,tokenがあれば購入できる' do
        expect(@buy_form).to be_valid
      end
      it 'post_codeが3文字ハイフン4文字だと購入できる' do
        @buy_form.post_code = '123-4567'
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
    end
  end
end
