class Content < ApplicationRecord
  self.table_name = "contents"
  validates :description, presence: true
end
