class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '予定' },
    { id: 2, name: 'Todo' },
    { id: 3, name: '完了済Todo'}
  ]
  end