# == Schema Information
#
# Table name: microposts
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence =>true
#  validates :content, :presence =>true, :length => { :maximum => 20, :minimum => 10}
end
