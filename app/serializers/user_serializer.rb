class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :at_key
  attribute :clients do | user |
    user.clients do |client|
      {
        id: client.id,
        name: client.name,
        base: client.at_base, 
        table: client.at_table
      }
    end
  end
end
