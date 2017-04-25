class Distribution < ApplicationRecord
	belongs_to :note
	has_one :investor, :through => :note
end
