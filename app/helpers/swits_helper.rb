module SwitsHelper
	def door_tag?(text)
		dt = /(\{.+\})/.match(text)
		if dt.nil?
			false
		else
			true
		end
	end
end
