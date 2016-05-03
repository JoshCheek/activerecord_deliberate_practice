# Diagram: https://gist.github.com/JoshCheek/e60015c983bbe842cffeb02b75452937
require_relative 'setup'
ActiveRecord::Schema.define do
  self.verbose = false

  # MIGRATIONS
  # <-- your work goes here
end

# MODELS
# <-- your work goes here


# TESTS
class JellyBeansTest < Minitest::Test
  def test_jelly_beans_have_a_color
    bean = JellyBean.new(color: 'black')
    assert_equal 'black', bean.color
  end

  def test_jelly_beans_are_orange_by_default
    assert_equal 'orange', JellyBean.new.color
  end

  def test_jelly_beans_belong_to_a_jar
    jar1 = Jar.create! jelly_beans: [JellyBean.new(color: 'blue')]
    jar2 = Jar.create! jelly_beans: [JellyBean.new(color: 'green')]
    assert_equal jar1, JellyBean.find_by(color: 'blue').jar
    assert_equal jar2, JellyBean.find_by(color: 'green').jar
  end

  def test_jars_have_jelly_beans
    jar = Jar.create! jelly_beans: [
      JellyBean.new(color: 'blue'),
      JellyBean.new(color: 'green')
    ]
    assert_equal ['blue', 'green'], jar.jelly_beans.pluck(:color)
  end
end
