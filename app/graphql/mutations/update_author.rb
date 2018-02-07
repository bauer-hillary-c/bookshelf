class Mutations::UpdateAuthor < GraphQL::Function

  argument :id, types.ID

  argument :first_name, types.String
  argument :last_name, types.String
  argument :birth_year, types.Int
  argument :is_alive, types.Boolean

  type Types::AuthorType

  def call(obj, args, ctx)
    author = Author.find(args[:id])
    author.try(:update, args.to_h)
    author
  end
end
