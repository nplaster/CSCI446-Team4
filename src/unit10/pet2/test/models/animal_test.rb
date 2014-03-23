require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  fixtures :animals
  test "animal attributes must not be empty" do
    animal = Animal.new
    assert animal.invalid?
    assert animal.errors[:name].any?
    assert animal.errors[:description].any?
    assert animal.errors[:age].any?
    assert animal.errors[:image_url].any?
    assert animal.errors[:status_id].any?
    assert animal.errors[:gender].any?
  end
  
  test "animal age must be positive" do
    animal = Animal.new(name: "My Book Title",
    description: "yyy",
    image_url: "zzz.jpg", 
    status_id: "Fostered", 
    gender: "Male")
    animal.age = -1
    assert animal.invalid?
    assert_equal ["must be greater than or equal to 0"],
    animal.errors[:age]
    animal.age = -6
    assert animal.invalid?
    assert_equal ["must be greater than or equal to 0"],
    animal.errors[:age]
    animal.age = 1
    assert animal.valid?
  end

  test "animals must be either male or female" do
    animal = Animal.new(name: "My Book Title",
    description: "yyy",
    image_url: "zzz.jpg", 
    status_id: "Fostered", 
    age: 1)
    assert animal.invalid?
    animal.gender = 'Male'
    assert animal.valid?
    animal.gender = 'Female'
    assert animal.valid?
    animal.gender = 'Smizmar'
    assert animal.invalid?
  end

  test "animals must be either Fostered or Available" do
    animal = Animal.new(name: "My Book Title",
    description: "yyy",
    image_url: "zzz.jpg", 
    gender: 'Female',
    age: 1)
    assert animal.invalid?
    animal.status_id = 'Fostered'
    assert animal.valid?
    animal.status_id = 'Available'
    assert animal.valid?
    animal.status_id = 'homeless'
    assert animal.invalid?
  end
end
