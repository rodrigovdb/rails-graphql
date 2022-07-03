# frozen_string_literal: true

module Mutations
  class ArtistCreate < BaseMutation
    description 'Create a new artist'

    type Types::ArtistType
    null true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    def resolve(**params)
      artist = ::Artist.new(params)
      raise GraphQL::ExecutionError.new 'Error creating artist', extensions: artist.errors.to_hash unless artist.save

      artist
    end
  end
end
