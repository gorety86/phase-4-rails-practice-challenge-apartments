class Lease < ApplicationRecord
    attributes :rent
    belongs_to :apartment
    belongs_to :tenant
end
