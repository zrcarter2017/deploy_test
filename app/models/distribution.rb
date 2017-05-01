class Distribution < ApplicationRecord
	belongs_to :note
	belongs_to :investor, :through => :note
end
