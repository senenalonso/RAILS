module ApplicationHelper

	def message(text, option)
		if option==1
			alert(text)
		else
			notice(text)
		end
	end

	def notice(text)
		flash[:notice] = text 
	end

	def alert(text)
		flash[:alert] = text
	end

end
