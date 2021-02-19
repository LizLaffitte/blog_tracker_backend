class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :at_key
end
