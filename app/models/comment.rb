class Comment < ApplicationRecord
    belongs_to :prototype  # tweetsテーブルとのアソシエーション
    belongs_to :user  # usersテーブルとのアソシエーション
    validates :text,       presence: true
  end