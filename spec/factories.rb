Factory.sequence(:email) { |n| "user#{n}@example.com" }
Factory.sequence(:title) { |n| "Sample link ##{n}"}
Factory.sequence(:url) { |n| "www.sampleurl#{n}.com"}


Factory.define :user do |user|
  user.email { Factory.next :email }
  user.password "password"
  user.password_confirmation { |u| u.password }
end

Factory.define :link do |link|
  link.title { Factory.next :title }
  link.url { Factory.next :url }
  link.association :submitter, :factory => :user
end

Factory.define :vote do |vote|
  vote.value 1
  vote.association :voter, :factory => :user
  vote.association :link
end