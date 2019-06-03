class Question < Content
  default_scope { where('contents.content_type = 2') }
  attribute :content_type, :integer, default: 2
  # association
  has_one :answer, class_name: 'Answer', foreign_key: :parent_id, dependent: :destroy
  belongs_to :article,  class_name: 'Article', foreign_key: :parent_id, touch: true
  # validation
  validates :content_type, numericality: { equal_to: 2 }
end
