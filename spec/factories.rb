Factory.sequence(:email) { |n| "user#{n}@example.com" }

Factory.define :user do |user|
  user.email { Factory.next :email }
  user.password "password"
  user.password_confirmation { |u| u.password }
end

Factory.define :link do |link|
  link.title 'This guy copied my site'
  link.url 'www.reddit.com'
  link.association :submitter, :factory => :user
end