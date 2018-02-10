Types::UserType = GraphQL::ObjectType.define do
  name "UserType"

  field :id, types.ID
  field :email, !types.String
  field :isSuperadmin, types.Boolean
end
