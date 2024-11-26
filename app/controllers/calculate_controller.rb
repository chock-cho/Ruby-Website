class CalculateController < ApplicationController
	def add
	end
	
	def result
		@result = params[:first].to_i + params[:second].to_i
	end
end
