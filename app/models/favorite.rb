class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book

  #userは1つの投稿に対して１つしかいいねをつけられないようにする。
  validates_uniqueness_of :book_id, scope: :user_id


end
