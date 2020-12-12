class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '予定' },
    { id: 2, name: 'Todo' },
  ]
  end