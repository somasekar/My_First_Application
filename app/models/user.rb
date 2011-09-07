# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
#require 'digest'

class User < ActiveRecord::Base
  has_many :microposts
#  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #  attr_accessible :name, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,  :presence => true,
    :length   => { :maximum => 15 }
  validates :last_name,  :presence => true,
    :length   => { :maximum => 10 }
  validates :email, :presence => true,
    :format   => { :with => email_regex },
    :uniqueness => { :case_sensitive => true }
  validates :user_name,  :presence => true,
    :length   => { :maximum => 10 }
  validates :password, :confirmation => true, :presence => true
  
  validates :present_add,  :presence => true,
    :length   => { :maximum => 10 }
  validates :permanent_add,  :presence => true,
    :length   => { :maximum => 10 }
  validates :date_of_birth,  :presence => true
                   
  validates :marital_status,  :presence => true,
    :length   => { :maximum => 10 }
  validates :mobile_number,  :presence => true,
    :length   => { :maximum => 10 }


  before_save :encrypted_password
#
#def has_password?(submitted_password)
#encrypted_password == encrypt(submitted_password)
#end
#
#private
#
#def encrypt_password
#end
#self.salt = make_salt if new_record?
#self.encrypted_password = encrypt(password)
#
#def encrypt(string)
#secure_hash("#{salt}--#{string}")
#end
#
#def make_salt
#secure_hash("#{Time.now.utc}--#{password}")
#end
#def secure_hash(string)
#Digest::SHA2.hexdigest(string)
#end

  def self.authenticate(user_name,password)
    User.find_by_user_name_and_password(user_name,password)
  end
  
  def encrypted_password
    self.encrypt_password=Digest::SHA1.hexdigest(self.password)
  end
  
 end

