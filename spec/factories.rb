Factory.define :user do |f|
  f.email "user@example.com"
  f.password "password"
  f.password_confirmation { |u| u.password }
end