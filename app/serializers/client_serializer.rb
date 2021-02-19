class ClientSerializer
  include JSONAPI::Serializer
  attributes :name, :website, :user_id, :at_base, :at_table
end
