class Post < ActiveRecord::Base
  validates :title, precense: true
  validates :description, precense: true
end
