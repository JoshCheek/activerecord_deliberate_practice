# This one is purely for example purposes
require_relative 'setup'
ActiveRecord::Schema.define do
  self.verbose = false

  # MIGRATIONS
  create_table :example_authors do |t|
    t.string :name
  end

  create_table :example_posts do |t|
    t.string  :title
    t.text    :body
    t.integer :example_author_id
  end

  create_table :example_comments do |t|
    t.string  :name
    t.text    :body
    t.integer :example_post_id
  end
end


# MODELS
class ExampleAuthor < ActiveRecord::Base
  has_many :example_posts
  has_many :example_comments, through: :example_posts
end

class ExamplePost < ActiveRecord::Base
  belongs_to :example_author
  has_many :example_comments
end

class ExampleComment < ActiveRecord::Base
  belongs_to :example_post
end


# TESTS
class ExampleTableTest < Minitest::Test
  def test_authors_know_their_posts
    ExampleAuthor.create! name: 'Josh' do |josh|
      josh.example_posts.build title: 'Things I do for fun', body: 'waterski'
      josh.example_posts.build title: 'random thoughts', body: 'random cannot exist in a deterministic universe'
    end
    ExampleAuthor.create! name: 'Brant' do |josh|
      josh.example_posts.build title: '3 ways to get better', body: '1) practice, 2) practice, 3) practice'
      josh.example_posts.build title: 'One more way to get better', body: 'practice'
    end

    # Josh's posts
    josh  = ExampleAuthor.find_by name: 'Josh'
    assert_equal ['Things I do for fun', 'random thoughts'],
                 josh.example_posts.pluck(:title)
    assert_equal ['waterski', 'random cannot exist in a deterministic universe'],
                 josh.example_posts.pluck(:body)

    # Brant's posts
    brant = ExampleAuthor.find_by name: 'Brant'
    assert_equal ['3 ways to get better', 'One more way to get better'],
                 brant.example_posts.pluck(:title)
    assert_equal ['1) practice, 2) practice, 3) practice', 'practice'],
                 brant.example_posts.pluck(:body)
  end

  def test_posts_know_their_author
    rod = ExampleAuthor.create! name: 'Rod', example_posts: [ExamplePost.new(title: 'Rod says', body: 'Practice more!')]
    assert_equal rod, ExamplePost.last.example_author
  end

  def test_posts_can_have_comments
    sara = ExampleAuthor.create! name: 'Sara' do |sara|
      sara.example_posts.build title: 'I am posting!' do |post|
        post.example_comments.build body: 'This is a comment!', name: 'Mei'
        post.example_comments.build body: 'Thanks for the comment!', name: 'Sara'
      end
    end

    post = sara.example_posts.first

    assert_equal ['This is a comment!', 'Thanks for the comment!'],
                 post.example_comments.pluck(:body)
    assert_equal ['Mei', 'Sara'], post.example_comments.pluck(:name)
  end

  def test_authors_know_about_the_comments_on_their_posts
    jane = ExampleAuthor.create! name: 'Jane' do |jane|
      jane.example_posts.build title: 'This is a post!' do |post|
        post.example_comments.build body: 'first',  name: 'Jim'
        post.example_comments.build body: 'second', name: 'Jan'
      end
    end

    assert_equal ['first', 'second'], jane.example_comments.pluck(:body)
    assert_equal ['Jim', 'Jan'], jane.example_comments.pluck(:name)
  end
end
