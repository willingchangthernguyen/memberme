require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'Print all children of a student' do
    lisa = Student.create(name: 'Lisa')
    katie = Student.create(name: 'Katie', parent: lisa)
    david = Student.create(name: 'David', parent: lisa)
    expect(lisa.children.map(&:name)).to match_array(['Katie', 'David'])
  end
  it 'Print all grandchildren of a student' do
    mark = Student.create(name: 'Mark')
    julie = Student.create(name: 'Julie', parent: mark)
    alex = Student.create(name: 'Alex', parent: mark)
    greg = Student.create(name: 'Greg', parent: julie)
    frank = Student.create(name: 'Frank', parent: alex)
    jane = Student.create(name: "Jane", parent: alex)
    mark.update!(grandchildren_ids: [greg.id, frank.id, jane.id])
    expect(mark.grandchildren.map(&:name)).to match_array(['Greg', 'Frank', 'Jane'])
  end
end
