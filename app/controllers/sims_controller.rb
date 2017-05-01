class SimsController < ApplicationController
	def index
		@sims = Sim.all
	end

	def create
		@sim = Sim.create(sim_params)
		redirect_to root_path
	end

	private

	def sim_params
		params.require(:sim).permit(:date, :title, :amount)
	end
end
