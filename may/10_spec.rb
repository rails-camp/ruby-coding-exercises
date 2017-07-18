require 'rspec'

def position_enforcer(pre_existing_array, new_obj_to_add)
  return set_default_of_position_one_for_first_element(pre_existing_array, new_obj_to_add) if pre_existing_array.empty?
  return add_obj_to_end_of_collection(pre_existing_array, new_obj_to_add) unless new_obj_to_add[:position]
  add_obj_and_resort(pre_existing_array, new_obj_to_add)
end

def set_default_of_position_one_for_first_element(arr, obj)
  obj[:position] = 1
  arr << obj
end

def add_obj_to_end_of_collection(arr, obj)
  stack_position = arr.last[:position] + 1
  obj[:position] = stack_position
  arr << obj
end

def add_obj_and_resort(arr, obj)
  objects_with_positions_higher = arr.select { |e| e[:position] >= obj[:position] }
  objects_with_positions_higher.map { |e| e[:position] += 1 }
  objects_with_positions_higher.sort_by { |e| e[:position] }
  arr << obj
  arr.sort_by { |e| e[:position] }
end

describe 'always sorted object' do
  it 'assigns a position of 1 for the first object added to the array' do
    array_of_objects = []

    expect(
      position_enforcer(
        array_of_objects,
        { name: 'Robert Shun' }
      )
    ).to eq(
      [
        { name: 'Robert Shun', position: 1 }
      ]
    )
  end

  it 'takes in an array of objects that each contain a position attribute and ensures that it is always sorted properly' do
    array_of_objects = [
      { name: 'Benjamin Haribert', position: 1 },
      { name: 'Ranjit Asclepius', position: 2 },
      { name: 'Mansoor Ragnvald', position: 3 },
    ]

    expect(
      position_enforcer(
        array_of_objects,
        { name: 'Robert Shun' }
      )
    ).to eq(
      [
        { name: 'Benjamin Haribert', position: 1 },
        { name: 'Ranjit Asclepius', position: 2 },
        { name: 'Mansoor Ragnvald', position: 3 },
        { name: 'Robert Shun', position: 4 }
      ]
    )
  end

  it 'auto resorts the position values for an array of objects with the position attribute' do
    array_of_objects = [
      { name: 'Benjamin Haribert', position: 1 },
      { name: 'Ranjit Asclepius', position: 2 },
      { name: 'Mansoor Ragnvald', position: 3 },
    ]

    expect(
      position_enforcer(
        array_of_objects,
        { name: 'Robert Shun', position: 2 }
      )
    ).to eq(
      [
        { name: 'Benjamin Haribert', position: 1 },
        { name: 'Robert Shun', position: 2 },
        { name: 'Ranjit Asclepius', position: 3 },
        { name: 'Mansoor Ragnvald', position: 4 },
      ]
    )
  end
end
