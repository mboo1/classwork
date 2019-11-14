require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end 
end

class User
  attr_accessor :id, :fname, :lname
  def self.find_by_id(idx)
    # idx = idx.to_s
    # debugger
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE #{idx} = id")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_name(first)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE fname = #{first}")
    data.map {|datum| User.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def author_questions
    Questions.find_by_author_id(@id)
  end
end

class Questions 
  attr_accessor :id, :title, :body, :author
  def self.find_by_id(idx)
    # idx = idx.to_s
    # debugger
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE #{idx} = id")
    data.map {|datum| Questions.new(datum)}
  end

  def self.find_by_title(title)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")

    data.each do |datum| 
      if datum['title'] = title
        return Questions.new(datum)
      end
    end
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE #{author_id} = author_id")
    data.map{|datum| Questions.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end

class Reply
  attr_accessor :id, :question_id, :parent_id, :user_id, :body
  def self.find_by_id(idx)

    data = QuestionsDatabase.instance.execute("SELECT * FROM reply WHERE #{idx} = id")
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_title(title)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")

    data.each do |datum| 
      if datum['title'] = title
        return Questions.new(datum)
      end
    end
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM reply WHERE #{user_id} = user_id")
    data.map{|datum| Reply.new(datum)}
  end
  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM reply WHERE #{question_id} = question_id")
    data.map{|datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id'] if options['parent_id']
    @user_id = options['user_id']
  end
end