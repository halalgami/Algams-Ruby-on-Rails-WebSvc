json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :email, :password_digest, :realname, :status, :userinfo
  json.url user_url(user, format: :json)
end
