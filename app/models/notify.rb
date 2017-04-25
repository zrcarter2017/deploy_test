module Report
	class Notify < ApplicationRecord
		self.table_name = 'criterias'

		def self.where
			Notify.where(1 = 1)
		end


		protected

	    def readonly?
	    	true
	  	end
	end
end