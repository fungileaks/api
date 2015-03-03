module Fungileaks
  class Picking
    include Mongoid::Document
    field :picked_at, type: DateTime
    field :username,  type: String
    field :species,   type: String
    field :lat,       type: BigDecimal
    field :lng,       type: BigDecimal
  end
end
