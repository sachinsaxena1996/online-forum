class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :replies, class_name: "Comment", foreign_key: "reply_id"
end
