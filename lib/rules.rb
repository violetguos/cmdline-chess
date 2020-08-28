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

	def occupancy(board, destination)
    # can be done with arr2d [] operator
		raise NotImplementedError.new("You must implement #{__method__}.")
	end


end