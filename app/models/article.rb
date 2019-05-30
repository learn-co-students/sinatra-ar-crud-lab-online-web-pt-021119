class Article < ActiveRecord::Base
  attr_accessor :title, :content

  @@articles = []

  def initialize(title, content)
    @title = title
    @content = content
    @@articles << self
  end

  def self.all
    @@articles
  end

end
