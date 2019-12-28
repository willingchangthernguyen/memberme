class Student
  include Mongoid::Document
  field :name, type: String
  field :grandchildren_ids, type: Array, default: []

  # Validation
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :children, class_name: 'Student', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Student', optional: true

  def grandchildren
    Student.find(grandchildren_ids)
  end
end
