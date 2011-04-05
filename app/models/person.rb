class Person < ActiveRecord::Base
  has_many :addresses, :class_name => "Address"
  accepts_nested_attributes_for :addresses, :allow_destroy => true
end
