class Apartment < ApplicationRecord
    validates :number, presence: true, uniqueness: true
    
    has_many :leases, dependent: :destroy
    has_many :tenants, through: :leases
end
