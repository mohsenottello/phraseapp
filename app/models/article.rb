class Article < Content
  default_scope { where('contents.content_type = 1') }
  attribute :content_type, :integer, default: 1
  # association
  has_many :questions, class_name: 'Question', foreign_key: :parent_id, dependent: :destroy
  # validation
  validates :content_type, numericality: { equal_to: 1 }
end
