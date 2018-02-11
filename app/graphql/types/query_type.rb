Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :login, types.String do
    argument :email, types.String
    argument :password, types.String

    resolve ->(_, args, _) {
      user = User.find_by(email: args[:email])
      user.sessions.create.key if user.try(:authenticate, args[:password])
    }
  end

  field :current_user, Types::UserType do
    resolve ->(_, _, ctx) { ctx[:current_user] }
  end

  field :author, Types::AuthorType do
    argument :id, types.ID
    description "One author"
    resolve ->(obj, args, ctx) {
      Author.find(args[:id])
    }
  end

  field :all_authors, types[Types::AuthorType] do
    description "All the authors in the database"
    resolve ->(_, _, _) {
      Author.all
    }
  end
end
