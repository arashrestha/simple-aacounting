class Sim < ActiveRecord::Base
	validates :date, :title, :amount, presence: true

	def self.balance
		where("amount > ?",0).sum(:amount)

	end

	def self.debt
		where("amount < 0",0).sum(:amount)

	end

	def self.total 
		sum(:amount)
	end
end

