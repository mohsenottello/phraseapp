class Answer < Content
  default_scope { where('contents.content_type = 3') }
  attribute :content_type, :integer, default: 3
  # association
  belongs_to :question, class_name: 'Question', foreign_key: :parent_id, touch: true
  # validation
  validates :content_type, numericality: { equal_to: 3 }
  validates :parent_id, uniqueness: true
end
