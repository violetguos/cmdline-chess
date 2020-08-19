module Rules
	def boundry
    raise NotImplementedError.new("You must implement #{ __method__}.")
	end
	
	def overtake
		raise NotImplementedError.new("You must implement #{__method__}.")
	end 

	def no_jump
		raise NotImplementedError.new("You must implement #{__method__}.")
	end

	def occupancy
		raise NotImplementedError.new("You must implement #{__method__}.")

	end


end