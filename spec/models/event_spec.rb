require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  context '新規登録がうまくいくとき' do
    it '全ての項目がバリデーション通り存在すれば登録できる' do
      expect(@event).to be_valid
    end
    it 'detailがなくても登録できる' do
      @event.detail = ''
      expect(@event).to be_valid
    end
    it 'event_timeがなくても登録できる' do
      @event.event_time = ''
      expect(@event).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'titleが空だと登録できない' do
      @event.title = ''
      @event.valid?
      expect(@event.errors.full_messages).to include("Title can't be blank")
    end
    it 'event_dateが空だと登録できない' do
      @event.event_date = ''
      @event.valid?
      expect(@event.errors.full_messages).to include("Event date can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @event.category_id = ''
      @event.valid?
      expect(@event.errors.full_messages).to include("Category can't be blank")
    end
  end

end
