class SimsController < ApplicationController
	def index
		@sims = Sim.all
	end

	def create
		@sim = Sim.create(sim_params)
		if @sim.vald?
			#
		else
			#
		end
		redirect_to root_path
	end

	
	def edit
		@sim = Sim.find(params[:id])
	end

	def update
		@sim = Sim.find(params[:id])
		if @sim.update(sim_params)
		   redirect_to root_path
		 else
		   redirect_to edit_sim_path(params[:id])
		end
    end

    def destroy
	  @sim = Sim.find(params[:id])
	  @sim.destroy
	  redirect_to root_path
	end

	def new
	end

	private

	def sim_params
		params.require(:sim).permit(:date, :title, :amount)
	end

end
