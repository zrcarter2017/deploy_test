module Report
	class Notify < ApplicationRecord
		self.table_name = 'criterias'

		protected

	    def readonly?
	    	true
	  	end
	end
end