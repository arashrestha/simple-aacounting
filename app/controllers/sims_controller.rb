class SimsController < ApplicationController
	def index
		@sims = Sim.all
	end
end
