module Fungileaks
  class Picking
    include Mongoid::Document
    field :picked_at, type: TimeWithZone
    field :username, type: String
    field :species, type: String
    field :weight, type: BigDecimal
  end
end
