module Fungileaks
  class Picking
    include Mongoid::Document
    field :picked_at, type: DateTime
    field :username,  type: String
    field :species,   type: String
    field :latlng,    type: String
  end
end
