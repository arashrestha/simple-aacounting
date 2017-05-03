class SimsController < ApplicationController
	def index
		@sims = Sim.all
		@balance=Sim.balance
		@debt=Sim.debt
		@total=Sim.total
	end

	def create
		@sim = Sim.create(sim_params)
		if @sim.valid?
			flash[:sucess]="New record has been created"
			redirect_to root_path
		else
		 	flash[:alert]="Woops! A element is missing!"
		 	redirect_to new_sim_path(params[:id])

		end
	end

	
	def edit
		@sim = Sim.find(params[:id])
	end

	def update
		@sim = Sim.find(params[:id])
		if @sim.update(sim_params)
			flash[:sucess]="Your record has been updated"
		   redirect_to root_path
		 else
		 	flash[:alert]="Woops! Looks like there has been an error!"
		   redirect_to edit_sim_path(params[:id])
		end
    end

    def destroy
	  @sim = Sim.find(params[:id])
	  @sim.destroy
	  flash[:sucess]= "A record has been deleted"
	  redirect_to root_path
	end

	def new
	end

	private

	def sim_params
		params.require(:sim).permit(:date, :title, :amount)
	end

end
