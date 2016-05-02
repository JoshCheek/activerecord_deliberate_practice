require_relative 'setup'
ActiveRecord::Schema.define do
  self.verbose = false

  # MIGRATIONS
  create_table :example_users do |t|
    t.string :name
    t.integer :age
  end
end

# MODELS
class ExampleUser < ActiveRecord::Base
end

# TESTS
class TestExampleUser < Minitest::Test
  def test_it_has_a_name_which_is_a_string
    ExampleUser.create! name: 'Jim'
    assert_equal 'Jim', ExampleUser.last.name
  end

  def test_it_has_an_age_which_is_an_integer
    ExampleUser.create! age: 123
    assert_equal 123, ExampleUser.last.age
  end
end


class TestColumnTypes < Minitest::Test
  # Reference: http://guides.rubyonrails.org/active_record_migrations.html
end


# create_table
#   string
#   integer
#   timestamps
#   datetime
#   text
#   boolean
#   float
#   modifiers:
#     limit       Sets the maximum size of the string/text/binary/integer fields.
#     precision   Defines the precision for the decimal fields, representing the total number of digits in the number.
#     scale       Defines the scale for the decimal fields, representing the number of digits after the decimal point.
#     polymorphic Adds a type column for belongs_to associations.
#     null        Allows or disallows NULL values in the column.
#     default     Allows to set a default value on the column. Note that if you are using a dynamic value (such as a date), the default will only be calculated the first time (i.e. on the date the migration is applied).
#     index       Adds an index for the column.
#     required    Adds required: true for belongs_to associations and null: false to the column in the migration.
# change_table
#   remove
#   rename
# misc
#   index
#   running
#   rolling back
#   running in a given environment
