class Distribution < ApplicationRecord
	has_one :note
	has_one :investor, :through => :note
end
