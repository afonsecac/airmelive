module EventsHelper
	def round(no)

		if no%4 != 0
			no = (no+(4-(no%4)))/4 
		else
			no
		end

	end
end
