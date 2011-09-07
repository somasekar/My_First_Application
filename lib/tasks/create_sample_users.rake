#require 'active_record'

namespace :users do
  desc "Fill database with sample data"
  task :create_sample_users do
    Rake::Task['create_sample_users:reset'].invoke
    u = User.first
    u.create!(:first_name => "Sony",
      :last_name => "Electronics",
      :email => "sonyelectronics@sony.com",
      :user_name => "sony4u",
      :password => "abc",
      :present_add => "abc",
      :permanent_add => "Bangalore",
      :date_of_birth => Time.now.to_date,
      :marital_status => "unmarried",
      :mobile_number => "65860")
  end
end

