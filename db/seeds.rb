# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create([{ :email => "user@example.com",
                      :password => "password"}])
link = Link.create([{ :title => "This links to Reddit",
                      :url => "www.reddit.com",
                      :submitter => User.first },
                    { :title => "This links to Google",
                      :url => "www.google.com",
                      :submitter => User.first }])
vote = Vote.create([{ :link => Link.last,
                      :voter => User.first,
                      :value => 1}])
