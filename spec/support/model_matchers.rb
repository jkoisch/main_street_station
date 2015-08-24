# The following matchers are all based on Machinist and apply to Model specs

RSpec::Matchers.define :fail_with_null do |attribute|
  match do |actual|
    factory_name = actual.name.underscore.to_sym
    attr_list = FactoryGirl.attributes_for(factory_name)
    attr_list.delete(attribute)
    !actual.new(attr_list).valid?
  end
  failure_message do |actual|
    "#{actual.name} should not be valid without #{attribute.to_s}"
  end
end

RSpec::Matchers.define :pass_with_null do |attribute|
  match do |actual|
    factory_name = actual.name.underscore.to_sym
    attr_list = FactoryGirl.attributes_for(factory_name)
    attr_list.delete(attribute)
    actual.new(attr_list).valid?
  end
  failure_message do |actual|
    "#{actual.name} should be valid without #{attribute.to_s}"
  end
end

RSpec::Matchers.define :fail_with_non_numeric do |attribute|
  match do |actual|
    factory_name = actual.name.underscore.to_sym
    attr_list = FactoryGirl.attributes_for(factory_name)
    attr_list.delete(attribute)
    attr_list[attribute] = 'x'
    !actual.new(attr_list).valid?
  end
  failure_message do |actual|
    "#{actual.name} should not be valid without #{attribute.to_s}"
  end
end

RSpec::Matchers.define :fail_with_string_beyond_limit do |attribute, max_length|
  match do |actual|
    factory_name = actual.name.underscore.to_sym
    attr_list = FactoryGirl.attributes_for(factory_name)
    attr_list.store(attribute, Faker::Lorem.characters(max_length + 1))
    !actual.new(attr_list).valid?
  end
  failure_message do |actual|
    "#{actual.name} should not be valid with #{attribute.to_s} longer than #{max_length}"
  end
end
